"""Tests for setting up the integration and its entities."""

from __future__ import annotations

from pytest_homeassistant_custom_component.common import MockConfigEntry

from custom_components.geosun_eco_one.const import (
    CONF_ADDITIONAL_ENTITIES,
    CONF_ENABLED_DEFAULT_ENTITIES,
    CONF_SCAN_INTERVAL,
    DOMAIN,
)
from custom_components.geosun_eco_one.entity_definitions import DEFAULT_ENTITIES
from homeassistant.config_entries import SOURCE_REAUTH, ConfigEntryState
from homeassistant.core import HomeAssistant
from homeassistant.helpers import entity_registry as er

from .conftest import entry_data

LEGACY_ENTITY_IDS = [
    "sensor.dhw_temperature",
    "sensor.dhw_temperature_hysteresis",
    "sensor.hw_temperature",
    "sensor.hw_target_temperature",
    "sensor.heat_pump_power",
    "sensor.heat_pump_consumption",
    "sensor.heat_pump_cop",
    "sensor.heat_pump_relative_power",
    "sensor.water_heater_in",
    "sensor.water_heater_out",
    "sensor.outside_temperature_now",
    "switch.hw_heater_setting",
    "switch.dhw_heater_setting",
    "switch.dhw_heater_plan",
    "switch.electric_boiler_manual_mode",
    "binary_sensor.hw_heater_status",
    "binary_sensor.dhw_heater_status",
    "binary_sensor.pump_mode_heat",
    "binary_sensor.pump_mode_cool",
    "binary_sensor.pump_mode_defrost",
    "binary_sensor.electric_boiler_status",
    "number.dhw_temperature_setting",
    "text.dhw_heating_from",
    "text.dhw_heating_to",
]


async def _setup(hass: HomeAssistant, host: str, **options) -> MockConfigEntry:
    entry = MockConfigEntry(domain=DOMAIN, data=entry_data(host), options=options, unique_id=host)
    entry.add_to_hass(hass)
    await hass.config_entries.async_setup(entry.entry_id)
    await hass.async_block_till_done()
    return entry


async def test_entities_keep_appdaemon_entity_ids(hass: HomeAssistant, fake_unit) -> None:
    entry = await _setup(hass, fake_unit.host)
    assert entry.state is ConfigEntryState.LOADED

    registry = er.async_get(hass)
    created = sorted(e.entity_id for e in er.async_entries_for_config_entry(registry, entry.entry_id))
    assert created == sorted(LEGACY_ENTITY_IDS)
    assert len(LEGACY_ENTITY_IDS) == len(DEFAULT_ENTITIES)


async def test_entity_states(hass: HomeAssistant, fake_unit) -> None:
    await _setup(hass, fake_unit.host)

    dhw = hass.states.get("sensor.dhw_temperature")
    assert dhw.state == "29.9"
    assert dhw.attributes["unit_of_measurement"] == "°C"
    assert dhw.attributes["state_class"] == "measurement"
    assert dhw.attributes["friendly_name"] == "Eco DHW temperature"

    cop = hass.states.get("sensor.heat_pump_cop")
    assert cop.state == "4.71"
    assert cop.attributes["state_class"] == "measurement"
    assert "device_class" not in cop.attributes

    assert hass.states.get("switch.dhw_heater_setting").state == "on"
    assert hass.states.get("switch.electric_boiler_manual_mode").state == "off"
    assert hass.states.get("binary_sensor.pump_mode_heat").state == "on"
    assert hass.states.get("text.dhw_heating_from").state == "16:00"

    setting = hass.states.get("number.dhw_temperature_setting")
    assert setting.state == "32.0"
    assert setting.attributes["min"] == 20
    assert setting.attributes["max"] == 55


async def test_taken_entity_id_gets_suffix(hass: HomeAssistant, fake_unit) -> None:
    """An old MQTT entity left in place pushes the new one to `_2`."""
    registry = er.async_get(hass)
    registry.async_get_or_create("sensor", "mqtt", "dhw_temperature", suggested_object_id="dhw_temperature")

    await _setup(hass, fake_unit.host)
    assert hass.states.get("sensor.dhw_temperature_2").state == "29.9"


async def test_switch_writes_and_refreshes(hass: HomeAssistant, fake_unit) -> None:
    await _setup(hass, fake_unit.host)
    logins = fake_unit.logins

    await hass.services.async_call(
        "switch", "turn_off", {"entity_id": "switch.dhw_heater_setting"}, blocking=True
    )
    await hass.services.async_call(
        "number", "set_value", {"entity_id": "number.dhw_temperature_setting", "value": 45}, blocking=True
    )
    await hass.services.async_call(
        "text", "set_value", {"entity_id": "text.dhw_heating_from", "value": "6:30"}, blocking=True
    )
    await hass.async_block_till_done()

    assert fake_unit.posts == [
        ("PAGE143.XML", {"__TE5A77326_BOOL_i": "0"}),
        ("PAGE144.XML", {"__TDF2423B2_REAL_.1f": "45.0"}),
        ("PAGE144.XML", {"__T324BA0AB_TIME_Thh:mm": "06:30"}),
    ]
    assert fake_unit.logins > logins + 3  # each write plus a refresh
    assert fake_unit.logins == fake_unit.logouts


async def test_failed_write_raises(hass: HomeAssistant, fake_unit) -> None:
    await _setup(hass, fake_unit.host)
    fake_unit.expire_sessions_on_post = True

    try:
        await hass.services.async_call(
            "switch", "turn_on", {"entity_id": "switch.dhw_heater_plan"}, blocking=True
        )
    except Exception as err:  # noqa: BLE001
        assert "Failed to write dhw_heater_plan" in str(err)
    else:
        raise AssertionError("write should have failed")


async def test_unreachable_unit_retries_setup(hass: HomeAssistant, socket_enabled) -> None:
    entry = await _setup(hass, "127.0.0.1:9")
    assert entry.state is ConfigEntryState.SETUP_RETRY
    assert hass.states.async_all() == []


async def test_rejected_password_starts_reauth(hass: HomeAssistant, fake_unit) -> None:
    fake_unit.password = "changed"
    entry = await _setup(hass, fake_unit.host)

    assert entry.state is ConfigEntryState.SETUP_ERROR
    flows = hass.config_entries.flow.async_progress()
    assert [flow["context"]["source"] for flow in flows] == [SOURCE_REAUTH]


async def test_options_change_reloads(hass: HomeAssistant, fake_unit) -> None:
    entry = await _setup(hass, fake_unit.host)

    hass.config_entries.async_update_entry(
        entry,
        options={
            CONF_SCAN_INTERVAL: 60,
            CONF_ENABLED_DEFAULT_ENTITIES: ["dhw_temperature"],
            CONF_ADDITIONAL_ENTITIES: (
                "- {object_id: outside_avg, page: PAGE183.XML, value_key: __T7AD7D32E_REAL_.1f,"
                " kind: sensor, name: Outside average, unit: C}"
            ),
        },
    )
    await hass.async_block_till_done()

    assert entry.state is ConfigEntryState.LOADED
    assert hass.states.get("sensor.outside_avg").state == "5.2"
    assert hass.states.get("sensor.dhw_temperature").state == "29.9"
    assert hass.states.get("switch.dhw_heater_setting").state == "unavailable"


async def test_unload(hass: HomeAssistant, fake_unit) -> None:
    entry = await _setup(hass, fake_unit.host)
    assert await hass.config_entries.async_unload(entry.entry_id)
    assert entry.state is ConfigEntryState.NOT_LOADED

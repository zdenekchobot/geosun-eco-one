"""Tests for the config, reauth and options flows."""

from __future__ import annotations

from pytest_homeassistant_custom_component.common import MockConfigEntry

from custom_components.geosun_eco_one.const import (
    CONF_ADDITIONAL_ENTITIES,
    CONF_ENABLED_DEFAULT_ENTITIES,
    CONF_HOST,
    CONF_SCAN_INTERVAL,
    DOMAIN,
)
from homeassistant.config_entries import SOURCE_USER
from homeassistant.const import CONF_PASSWORD, CONF_USERNAME
from homeassistant.core import HomeAssistant
from homeassistant.data_entry_flow import FlowResultType

from .conftest import PASSWORD, entry_data


async def _start(hass: HomeAssistant):
    return await hass.config_entries.flow.async_init(DOMAIN, context={"source": SOURCE_USER})


async def test_user_flow_creates_entry(hass: HomeAssistant, fake_unit) -> None:
    result = await _start(hass)
    assert result["type"] is FlowResultType.FORM

    result = await hass.config_entries.flow.async_configure(result["flow_id"], entry_data(fake_unit.host))
    assert result["type"] is FlowResultType.CREATE_ENTRY
    assert result["title"] == "Eco"
    assert result["result"].unique_id == f"http://{fake_unit.host}"


async def test_user_flow_errors(hass: HomeAssistant, fake_unit, socket_enabled) -> None:
    result = await _start(hass)

    data = entry_data(fake_unit.host) | {CONF_PASSWORD: "wrong"}
    result = await hass.config_entries.flow.async_configure(result["flow_id"], data)
    assert result["errors"] == {"base": "invalid_auth"}

    data = entry_data("127.0.0.1:9")
    result = await hass.config_entries.flow.async_configure(result["flow_id"], data)
    assert result["errors"] == {"base": "cannot_connect"}

    data = entry_data("http://")
    result = await hass.config_entries.flow.async_configure(result["flow_id"], data)
    assert result["errors"] == {CONF_HOST: "invalid_host"}


async def test_user_flow_already_configured(hass: HomeAssistant, fake_unit) -> None:
    MockConfigEntry(domain=DOMAIN, unique_id=f"http://{fake_unit.host}").add_to_hass(hass)

    result = await _start(hass)
    result = await hass.config_entries.flow.async_configure(
        result["flow_id"], entry_data(f"http://{fake_unit.host}/")
    )
    assert result["type"] is FlowResultType.ABORT
    assert result["reason"] == "already_configured"


async def test_reauth(hass: HomeAssistant, fake_unit) -> None:
    entry = MockConfigEntry(
        domain=DOMAIN, data=entry_data(fake_unit.host) | {CONF_PASSWORD: "old"}, unique_id="x"
    )
    entry.add_to_hass(hass)

    result = await entry.start_reauth_flow(hass)
    assert result["step_id"] == "reauth_confirm"

    result = await hass.config_entries.flow.async_configure(
        result["flow_id"], {CONF_USERNAME: "user", CONF_PASSWORD: "still-wrong"}
    )
    assert result["errors"] == {"base": "invalid_auth"}

    result = await hass.config_entries.flow.async_configure(
        result["flow_id"], {CONF_USERNAME: "user", CONF_PASSWORD: PASSWORD}
    )
    await hass.async_block_till_done()
    assert result["type"] is FlowResultType.ABORT
    assert result["reason"] == "reauth_successful"
    assert entry.data[CONF_PASSWORD] == PASSWORD


async def test_options_flow_validates_yaml(hass: HomeAssistant, fake_unit) -> None:
    entry = MockConfigEntry(domain=DOMAIN, data=entry_data(fake_unit.host), unique_id="x")
    entry.add_to_hass(hass)
    await hass.config_entries.async_setup(entry.entry_id)
    await hass.async_block_till_done()

    result = await hass.config_entries.options.async_init(entry.entry_id)
    options = {
        CONF_SCAN_INTERVAL: 45,
        CONF_ENABLED_DEFAULT_ENTITIES: ["dhw_temperature"],
        CONF_ADDITIONAL_ENTITIES: "- {object_id: a, kind: light}",
    }
    result = await hass.config_entries.options.async_configure(result["flow_id"], options)
    assert result["errors"] == {CONF_ADDITIONAL_ENTITIES: "invalid_additional_entities"}
    assert "a: kind must be" in result["description_placeholders"]["error"]

    options[CONF_ADDITIONAL_ENTITIES] = ""
    result = await hass.config_entries.options.async_configure(result["flow_id"], options)
    await hass.async_block_till_done()
    assert result["type"] is FlowResultType.CREATE_ENTRY
    assert entry.options[CONF_SCAN_INTERVAL] == 45

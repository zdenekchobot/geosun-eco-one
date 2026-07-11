"""Entity definitions for Geosun Eco One."""

from __future__ import annotations

import json
from dataclasses import dataclass
from typing import Any


@dataclass(frozen=True, slots=True)
class GeosunEntityDescription:
    """Definition of one GEOSUN entity backed by an XML page input."""

    object_id: str
    page: str
    value_key: str
    kind: str
    name: str
    device_class: str | None = None
    icon: str | None = None
    unit: str | None = None
    precision: int | None = None
    payload_on: str | int | float | None = None
    payload_off: str | int | float | None = None
    mode: str | None = None
    min_value: float | int | None = None
    max_value: float | int | None = None
    step: float | int | None = None
    pattern: str | None = None


DEFAULT_ENTITIES: dict[str, GeosunEntityDescription] = {
    "dhw_temperature": GeosunEntityDescription(
        object_id="dhw_temperature",
        page="PAGE196.XML",
        value_key="__TF9DCC3BC_REAL_.1f",
        kind="sensor",
        name="DHW temperature",
        device_class="temperature",
        icon="mdi:water-boiler",
        unit="C",
        precision=1,
    ),
    "dhw_temperature_hysteresis": GeosunEntityDescription(
        object_id="dhw_temperature_hysteresis",
        page="PAGE144.XML",
        value_key="__T0E14023C_REAL_.1f",
        kind="sensor",
        name="DHW temperature hysteresis",
        device_class="temperature",
        icon="mdi:set-right",
        unit="C",
        precision=1,
    ),
    "hw_temperature": GeosunEntityDescription(
        object_id="hw_temperature",
        page="PAGE133.XML",
        value_key="__TF420903F_REAL_.1f",
        kind="sensor",
        name="HW temperature",
        device_class="temperature",
        icon="mdi:water-boiler",
        unit="C",
        precision=1,
    ),
    "hw_target_temperature": GeosunEntityDescription(
        object_id="hw_target_temperature",
        page="PAGE133.XML",
        value_key="__TB12A6D9A_REAL_.1f",
        kind="sensor",
        name="HW target temperature",
        device_class="temperature",
        icon="mdi:water-boiler",
        unit="C",
        precision=1,
    ),
    "heat_pump_power": GeosunEntityDescription(
        object_id="heat_pump_power",
        page="PAGE196.XML",
        value_key="__TA2C9CFCD_REAL_.2f",
        kind="sensor",
        name="Heat pump power",
        device_class="power",
        icon="mdi:heat-pump",
        unit="kW",
        precision=2,
    ),
    "heat_pump_consumption": GeosunEntityDescription(
        object_id="heat_pump_consumption",
        page="PAGE196.XML",
        value_key="__T7816B7E5_REAL_.2f",
        kind="sensor",
        name="Heat pump consumption",
        device_class="power",
        icon="mdi:heat-pump",
        unit="kW",
        precision=2,
    ),
    "heat_pump_COP": GeosunEntityDescription(
        object_id="heat_pump_COP",
        page="PAGE196.XML",
        value_key="__T1E26BB4F_REAL_.2f",
        kind="sensor",
        name="Heat pump COP",
        device_class="power_factor",
        icon="mdi:heat-pump",
        precision=2,
    ),
    "heat_pump_relative_power": GeosunEntityDescription(
        object_id="heat_pump_relative_power",
        page="PAGE196.XML",
        value_key="__TF7A12A3D_REAL_.0f",
        kind="sensor",
        name="Heat pump relative power",
        device_class="power_factor",
        icon="mdi:heat-pump",
        unit="%",
        precision=0,
    ),
    "water_heater_in": GeosunEntityDescription(
        object_id="water_heater_in",
        page="PAGE196.XML",
        value_key="__T7FEC1C3B_REAL_.1f",
        kind="sensor",
        name="Water heater in",
        device_class="temperature",
        icon="mdi:watermark",
        unit="C",
        precision=1,
    ),
    "water_heater_out": GeosunEntityDescription(
        object_id="water_heater_out",
        page="PAGE196.XML",
        value_key="__T20F39926_REAL_.1f",
        kind="sensor",
        name="Water heater out",
        device_class="temperature",
        icon="mdi:watermark",
        unit="C",
        precision=1,
    ),
    "outside_temperature_now": GeosunEntityDescription(
        object_id="outside_temperature_now",
        page="PAGE183.XML",
        value_key="__TFF513049_REAL_.1f",
        kind="sensor",
        name="Outside temperature",
        device_class="temperature",
        icon="mdi:home-thermometer",
        unit="C",
        precision=1,
    ),
    "hw_heater_setting": GeosunEntityDescription(
        object_id="hw_heater_setting",
        page="PAGE132.XML",
        value_key="__TDE1D9B85_BOOL_i",
        kind="switch",
        name="HW heater setting",
        device_class="switch",
        icon="mdi:toggle-switch",
        payload_on=1,
        payload_off=0,
    ),
    "dhw_heater_setting": GeosunEntityDescription(
        object_id="dhw_heater_setting",
        page="PAGE143.XML",
        value_key="__TE5A77326_BOOL_i",
        kind="switch",
        name="DHW heater",
        device_class="switch",
        icon="mdi:toggle-switch",
        payload_on=1,
        payload_off=0,
    ),
    "dhw_heater_plan": GeosunEntityDescription(
        object_id="dhw_heater_plan",
        page="PAGE143.XML",
        value_key="__T9B2DD143_BOOL_i",
        kind="switch",
        name="DHW plan",
        device_class="switch",
        icon="mdi:toggle-switch",
        payload_on=1,
        payload_off=0,
    ),
    "electric_boiler_manual_mode": GeosunEntityDescription(
        object_id="electric_boiler_manual_mode",
        page="PAGE157.XML",
        value_key="__T4C9EEAD0_BOOL_i",
        kind="switch",
        name="Electric boiler manual mode",
        device_class="switch",
        icon="mdi:toggle-switch",
        payload_on=1,
        payload_off=0,
    ),
    "hw_heater_status": GeosunEntityDescription(
        object_id="hw_heater_status",
        page="PAGE196.XML",
        value_key="__T4404AB14_BOOL_i",
        kind="binary_sensor",
        name="HW heater",
        icon="mdi:fire",
        payload_on=1,
        payload_off=0,
    ),
    "dhw_heater_status": GeosunEntityDescription(
        object_id="dhw_heater_status",
        page="PAGE143.XML",
        value_key="__T8D88EB9A_BOOL_i",
        kind="binary_sensor",
        name="DHW heater status",
        icon="mdi:fire",
        payload_on=1,
        payload_off=0,
    ),
    "pump_mode_heat": GeosunEntityDescription(
        object_id="pump_mode_heat",
        page="PAGE196.XML",
        value_key="__T39EF2789_BOOL_i",
        kind="binary_sensor",
        name="Pump mode HEAT",
        icon="mdi:fire",
        payload_on=1,
        payload_off=0,
    ),
    "pump_mode_cool": GeosunEntityDescription(
        object_id="pump_mode_cool",
        page="PAGE196.XML",
        value_key="__T192CCB67_BOOL_i",
        kind="binary_sensor",
        name="Pump mode COOL",
        icon="mdi:snowflake",
        payload_on=1,
        payload_off=0,
    ),
    "pump_mode_defrost": GeosunEntityDescription(
        object_id="pump_mode_defrost",
        page="PAGE196.XML",
        value_key="__TF62A071D_BOOL_i",
        kind="binary_sensor",
        name="Pump mode DEFROST",
        icon="mdi:snowflake-melt",
        payload_on=1,
        payload_off=0,
    ),
    "electric_boiler_status": GeosunEntityDescription(
        object_id="electric_boiler_status",
        page="PAGE157.XML",
        value_key="__T24D5A69E_BOOL_i",
        kind="binary_sensor",
        name="Electric boiler",
        icon="mdi:water-boiler-alert",
        payload_on=1,
        payload_off=0,
    ),
    "DHW_temperature_setting": GeosunEntityDescription(
        object_id="DHW_temperature_setting",
        page="PAGE144.XML",
        value_key="__TDF2423B2_REAL_.1f",
        kind="number",
        name="DHW temperature",
        device_class="temperature",
        icon="mdi:water-boiler",
        unit="C",
        precision=1,
        mode="slider",
        min_value=30,
        max_value=60,
        step=1,
    ),
    "DHW_heating_from": GeosunEntityDescription(
        object_id="DHW_heating_from",
        page="PAGE144.XML",
        value_key="__T324BA0AB_TIME_Thh:mm",
        kind="text",
        name="DHW heating from",
        icon="mdi:clock-digital",
        pattern="([01]?[0-9]|2[0-3]):[0-5][0-9]",
    ),
    "DHW_heating_to": GeosunEntityDescription(
        object_id="DHW_heating_to",
        page="PAGE144.XML",
        value_key="__TB07A911F_TIME_Thh:mm",
        kind="text",
        name="DHW heating to",
        icon="mdi:clock-digital",
        pattern="([01]?[0-9]|2[0-3]):[0-5][0-9]",
    ),
}


def build_entity_definitions(
    enabled_default_entities: list[str] | None,
    additional_entities_json: str,
) -> dict[str, GeosunEntityDescription]:
    """Build final definitions from default + user additions."""
    if enabled_default_entities is None:
        selected = set(DEFAULT_ENTITIES)
    else:
        selected = set(enabled_default_entities)

    entities = {
        key: definition
        for key, definition in DEFAULT_ENTITIES.items()
        if key in selected
    }

    for entity in parse_additional_entities(additional_entities_json):
        entities[entity.object_id] = entity

    return entities


def parse_additional_entities(text: str) -> list[GeosunEntityDescription]:
    """Parse additional entities in JSON format."""
    if not text.strip():
        return []

    parsed = json.loads(text)
    if not isinstance(parsed, list):
        raise ValueError("Additional entities must be a JSON list")

    items: list[GeosunEntityDescription] = []
    for item in parsed:
        if not isinstance(item, dict):
            raise ValueError("Each additional entity must be an object")

        raw: dict[str, Any] = item
        items.append(
            GeosunEntityDescription(
                object_id=_required_str(raw, "object_id"),
                page=_required_str(raw, "page"),
                value_key=_required_str(raw, "value_key"),
                kind=_required_str(raw, "kind"),
                name=_required_str(raw, "name"),
                device_class=_optional_str(raw, "device_class"),
                icon=_optional_str(raw, "icon"),
                unit=_optional_str(raw, "unit"),
                precision=_optional_int(raw, "precision"),
                payload_on=raw.get("payload_on"),
                payload_off=raw.get("payload_off"),
                mode=_optional_str(raw, "mode"),
                min_value=raw.get("min_value"),
                max_value=raw.get("max_value"),
                step=raw.get("step"),
                pattern=_optional_str(raw, "pattern"),
            )
        )

    return items


def _required_str(payload: dict[str, Any], key: str) -> str:
    value = payload.get(key)
    if not isinstance(value, str) or not value:
        raise ValueError(f"Field '{key}' is required and must be string")
    return value


def _optional_str(payload: dict[str, Any], key: str) -> str | None:
    value = payload.get(key)
    if value is None:
        return None
    if not isinstance(value, str):
        raise ValueError(f"Field '{key}' must be string")
    return value


def _optional_int(payload: dict[str, Any], key: str) -> int | None:
    value = payload.get(key)
    if value is None:
        return None
    if not isinstance(value, int):
        raise ValueError(f"Field '{key}' must be int")
    return value

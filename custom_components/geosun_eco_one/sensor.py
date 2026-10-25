"""Sensor platform for Geosun Eco One."""

from __future__ import annotations

from homeassistant.components.sensor import SensorDeviceClass, SensorEntity, SensorStateClass
from homeassistant.const import PERCENTAGE, UnitOfPower, UnitOfTemperature
from homeassistant.core import HomeAssistant
from homeassistant.helpers.entity_platform import AddConfigEntryEntitiesCallback

from . import GeosunConfigEntry, GeosunRuntimeData
from .entity import GeosunBaseEntity
from .entity_definitions import GeosunEntityDescription

UNIT_MAP = {
    "C": UnitOfTemperature.CELSIUS,
    "°C": UnitOfTemperature.CELSIUS,
    "kW": UnitOfPower.KILO_WATT,
    "%": PERCENTAGE,
}


async def async_setup_entry(
    hass: HomeAssistant,
    entry: GeosunConfigEntry,
    async_add_entities: AddConfigEntryEntitiesCallback,
) -> None:
    """Set up Geosun sensors."""
    runtime = entry.runtime_data
    async_add_entities(
        GeosunSensor(runtime, description, entry.entry_id)
        for description in runtime.entities.values()
        if description.kind == "sensor"
    )


class GeosunSensor(GeosunBaseEntity, SensorEntity):
    """Representation of a Geosun sensor."""

    def __init__(
        self,
        runtime: GeosunRuntimeData,
        description: GeosunEntityDescription,
        unique_prefix: str,
    ) -> None:
        super().__init__(runtime, description, unique_prefix)
        self._attr_device_class = (
            SensorDeviceClass(description.device_class) if description.device_class else None
        )
        self._attr_native_unit_of_measurement = (
            UNIT_MAP.get(description.unit, description.unit) if description.unit else None
        )
        self._attr_suggested_display_precision = description.precision
        # Numeric values get long-term statistics unless the definition says otherwise.
        if description.state_class:
            self._attr_state_class = SensorStateClass(description.state_class)
        elif description.unit or description.device_class:
            self._attr_state_class = SensorStateClass.MEASUREMENT

    @property
    def native_value(self) -> float | str | None:
        """Return parsed sensor value."""
        raw = self._raw_value
        if raw is None:
            return None

        try:
            return float(raw)
        except ValueError:
            return None if self.state_class else raw

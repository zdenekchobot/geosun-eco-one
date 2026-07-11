"""Sensor platform for Geosun Eco One."""

from __future__ import annotations

from homeassistant.components.sensor import SensorDeviceClass, SensorEntity
from homeassistant.config_entries import ConfigEntry
from homeassistant.const import UnitOfPower, UnitOfTemperature, PERCENTAGE
from homeassistant.core import HomeAssistant
from homeassistant.helpers.entity_platform import AddEntitiesCallback

from .const import DOMAIN
from .entity import GeosunBaseEntity
from .entity_definitions import GeosunEntityDescription

UNIT_MAP = {
    "C": UnitOfTemperature.CELSIUS,
    "kW": UnitOfPower.KILO_WATT,
    "%": PERCENTAGE,
}


async def async_setup_entry(
    hass: HomeAssistant,
    entry: ConfigEntry,
    async_add_entities: AddEntitiesCallback,
) -> None:
    """Set up Geosun sensors."""
    runtime = hass.data[DOMAIN][entry.entry_id]
    entities: dict[str, GeosunEntityDescription] = runtime["entities"]

    async_add_entities(
        GeosunSensor(runtime["coordinator"], description, runtime["device"], entry.entry_id)
        for description in entities.values()
        if description.kind == "sensor"
    )


class GeosunSensor(GeosunBaseEntity, SensorEntity):
    """Representation of a Geosun sensor."""

    @property
    def device_class(self) -> SensorDeviceClass | None:
        """Return sensor device class."""
        if not self.geosun_description.device_class:
            return None
        return SensorDeviceClass(self.geosun_description.device_class)

    @property
    def native_unit_of_measurement(self) -> str | None:
        """Return configured unit."""
        unit = self.geosun_description.unit
        if unit is None:
            return None
        return UNIT_MAP.get(unit, unit)

    @property
    def suggested_display_precision(self) -> int | None:
        """Return precision hint for UI."""
        return self.geosun_description.precision

    @property
    def native_value(self) -> float | str | None:
        """Return parsed sensor value."""
        raw = self._raw_value
        if raw is None:
            return None

        try:
            return float(raw)
        except ValueError:
            return raw

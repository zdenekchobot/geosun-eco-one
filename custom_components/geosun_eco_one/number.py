"""Number platform for Geosun Eco One."""

from __future__ import annotations

from homeassistant.components.number import NumberDeviceClass, NumberEntity
from homeassistant.config_entries import ConfigEntry
from homeassistant.const import UnitOfTemperature
from homeassistant.core import HomeAssistant
from homeassistant.helpers.entity_platform import AddEntitiesCallback

from .const import DOMAIN
from .entity import GeosunBaseEntity
from .entity_definitions import GeosunEntityDescription

UNIT_MAP = {
    "C": UnitOfTemperature.CELSIUS,
}


async def async_setup_entry(
    hass: HomeAssistant,
    entry: ConfigEntry,
    async_add_entities: AddEntitiesCallback,
) -> None:
    """Set up Geosun numbers."""
    runtime = hass.data[DOMAIN][entry.entry_id]
    entities: dict[str, GeosunEntityDescription] = runtime["entities"]

    async_add_entities(
        GeosunNumber(
            runtime["coordinator"],
            runtime["client"],
            description,
            runtime["device"],
            entry.entry_id,
        )
        for description in entities.values()
        if description.kind == "number"
    )


class GeosunNumber(GeosunBaseEntity, NumberEntity):
    """Representation of Geosun number entity."""

    def __init__(self, coordinator, client, description, device, unique_prefix) -> None:
        super().__init__(coordinator, description, device, unique_prefix)
        self._client = client

        self._attr_native_min_value = description.min_value
        self._attr_native_max_value = description.max_value
        self._attr_native_step = description.step
        self._attr_mode = description.mode

    @property
    def device_class(self) -> NumberDeviceClass | None:
        """Return device class."""
        if not self.geosun_description.device_class:
            return None
        return NumberDeviceClass(self.geosun_description.device_class)

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
    def native_value(self) -> float | None:
        """Return current numeric value."""
        raw = self._raw_value
        if raw is None:
            return None
        try:
            return float(raw)
        except ValueError:
            return None

    async def async_set_native_value(self, value: float) -> None:
        """Set numeric value."""
        await self._client.async_set_value(self.geosun_description, value)
        await self.coordinator.async_request_refresh()

"""Number platform for Geosun Eco One."""

from __future__ import annotations

from homeassistant.components.number import NumberDeviceClass, NumberEntity, NumberMode
from homeassistant.const import UnitOfTemperature
from homeassistant.core import HomeAssistant
from homeassistant.helpers.entity_platform import AddConfigEntryEntitiesCallback

from . import GeosunConfigEntry, GeosunRuntimeData
from .entity import GeosunBaseEntity
from .entity_definitions import GeosunEntityDescription

UNIT_MAP = {
    "C": UnitOfTemperature.CELSIUS,
    "°C": UnitOfTemperature.CELSIUS,
}


async def async_setup_entry(
    hass: HomeAssistant,
    entry: GeosunConfigEntry,
    async_add_entities: AddConfigEntryEntitiesCallback,
) -> None:
    """Set up Geosun numbers."""
    runtime = entry.runtime_data
    async_add_entities(
        GeosunNumber(runtime, description, entry.entry_id)
        for description in runtime.entities.values()
        if description.kind == "number"
    )


class GeosunNumber(GeosunBaseEntity, NumberEntity):
    """Representation of Geosun number entity."""

    def __init__(
        self,
        runtime: GeosunRuntimeData,
        description: GeosunEntityDescription,
        unique_prefix: str,
    ) -> None:
        super().__init__(runtime, description, unique_prefix)
        # Unset limits fall back to Home Assistant's defaults.
        if description.min_value is not None:
            self._attr_native_min_value = description.min_value
        if description.max_value is not None:
            self._attr_native_max_value = description.max_value
        if description.step is not None:
            self._attr_native_step = description.step
        self._attr_mode = NumberMode(description.mode) if description.mode else NumberMode.AUTO
        self._attr_device_class = (
            NumberDeviceClass(description.device_class) if description.device_class else None
        )
        self._attr_native_unit_of_measurement = (
            UNIT_MAP.get(description.unit, description.unit) if description.unit else None
        )

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
        await self._async_write_value(value)

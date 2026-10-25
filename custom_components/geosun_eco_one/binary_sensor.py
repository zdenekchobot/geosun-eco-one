"""Binary sensor platform for Geosun Eco One."""

from __future__ import annotations

from homeassistant.components.binary_sensor import BinarySensorDeviceClass, BinarySensorEntity
from homeassistant.core import HomeAssistant
from homeassistant.helpers.entity_platform import AddConfigEntryEntitiesCallback

from . import GeosunConfigEntry, GeosunRuntimeData
from .entity import GeosunBaseEntity
from .entity_definitions import GeosunEntityDescription


async def async_setup_entry(
    hass: HomeAssistant,
    entry: GeosunConfigEntry,
    async_add_entities: AddConfigEntryEntitiesCallback,
) -> None:
    """Set up Geosun binary sensors."""
    runtime = entry.runtime_data
    async_add_entities(
        GeosunBinarySensor(runtime, description, entry.entry_id)
        for description in runtime.entities.values()
        if description.kind == "binary_sensor"
    )


class GeosunBinarySensor(GeosunBaseEntity, BinarySensorEntity):
    """Representation of a Geosun binary sensor."""

    def __init__(
        self,
        runtime: GeosunRuntimeData,
        description: GeosunEntityDescription,
        unique_prefix: str,
    ) -> None:
        super().__init__(runtime, description, unique_prefix)
        self._attr_device_class = (
            BinarySensorDeviceClass(description.device_class) if description.device_class else None
        )

    @property
    def is_on(self) -> bool | None:
        """Return current state."""
        raw = self._raw_value
        if raw is None:
            return None

        if self.geosun_description.payload_on is None:
            return raw not in {"0", "false", "False", ""}

        return str(raw) == str(self.geosun_description.payload_on)

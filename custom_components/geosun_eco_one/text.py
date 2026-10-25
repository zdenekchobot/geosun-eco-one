"""Text platform for Geosun Eco One."""

from __future__ import annotations

from homeassistant.components.text import TextEntity
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
    """Set up Geosun text entities."""
    runtime = entry.runtime_data
    async_add_entities(
        GeosunText(runtime, description, entry.entry_id)
        for description in runtime.entities.values()
        if description.kind == "text"
    )


class GeosunText(GeosunBaseEntity, TextEntity):
    """Representation of Geosun text entity."""

    def __init__(
        self,
        runtime: GeosunRuntimeData,
        description: GeosunEntityDescription,
        unique_prefix: str,
    ) -> None:
        super().__init__(runtime, description, unique_prefix)
        self._attr_pattern = description.pattern

    @property
    def native_value(self) -> str | None:
        """Return current text value."""
        return self._raw_value

    async def async_set_value(self, value: str) -> None:
        """Set text value."""
        await self._async_write_value(value)

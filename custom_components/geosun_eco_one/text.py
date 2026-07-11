"""Text platform for Geosun Eco One."""

from __future__ import annotations

from homeassistant.components.text import TextEntity
from homeassistant.config_entries import ConfigEntry
from homeassistant.core import HomeAssistant
from homeassistant.helpers.entity_platform import AddEntitiesCallback

from .const import DOMAIN
from .entity import GeosunBaseEntity
from .entity_definitions import GeosunEntityDescription


async def async_setup_entry(
    hass: HomeAssistant,
    entry: ConfigEntry,
    async_add_entities: AddEntitiesCallback,
) -> None:
    """Set up Geosun text entities."""
    runtime = hass.data[DOMAIN][entry.entry_id]
    entities: dict[str, GeosunEntityDescription] = runtime["entities"]

    async_add_entities(
        GeosunText(
            runtime["coordinator"],
            runtime["client"],
            description,
            runtime["device"],
            entry.entry_id,
        )
        for description in entities.values()
        if description.kind == "text"
    )


class GeosunText(GeosunBaseEntity, TextEntity):
    """Representation of Geosun text entity."""

    def __init__(self, coordinator, client, description, device, unique_prefix) -> None:
        super().__init__(coordinator, description, device, unique_prefix)
        self._client = client
        self._attr_pattern = description.pattern

    @property
    def native_value(self) -> str | None:
        """Return current text value."""
        return self._raw_value

    async def async_set_value(self, value: str) -> None:
        """Set text value."""
        await self._client.async_set_value(self.geosun_description, value)
        await self.coordinator.async_request_refresh()

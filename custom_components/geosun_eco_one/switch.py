"""Switch platform for Geosun Eco One."""

from __future__ import annotations

from homeassistant.components.switch import SwitchEntity
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
    """Set up Geosun switches."""
    runtime = hass.data[DOMAIN][entry.entry_id]
    entities: dict[str, GeosunEntityDescription] = runtime["entities"]

    async_add_entities(
        GeosunSwitch(
            runtime["coordinator"],
            runtime["client"],
            description,
            runtime["device"],
            entry.entry_id,
        )
        for description in entities.values()
        if description.kind == "switch"
    )


class GeosunSwitch(GeosunBaseEntity, SwitchEntity):
    """Representation of Geosun switch."""

    def __init__(self, coordinator, client, description, device, unique_prefix) -> None:
        super().__init__(coordinator, description, device, unique_prefix)
        self._client = client

    @property
    def is_on(self) -> bool | None:
        """Return current state."""
        raw = self._raw_value
        if raw is None:
            return None
        return str(raw) == str(self.geosun_description.payload_on)

    async def async_turn_on(self, **kwargs) -> None:
        """Turn entity on."""
        await self._client.async_set_value(self.geosun_description, self.geosun_description.payload_on)
        await self.coordinator.async_request_refresh()

    async def async_turn_off(self, **kwargs) -> None:
        """Turn entity off."""
        await self._client.async_set_value(self.geosun_description, self.geosun_description.payload_off)
        await self.coordinator.async_request_refresh()

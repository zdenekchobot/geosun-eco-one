"""Switch platform for Geosun Eco One."""

from __future__ import annotations

from typing import Any

from homeassistant.components.switch import SwitchDeviceClass, SwitchEntity
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
    """Set up Geosun switches."""
    runtime = entry.runtime_data
    async_add_entities(
        GeosunSwitch(runtime, description, entry.entry_id)
        for description in runtime.entities.values()
        if description.kind == "switch"
    )


class GeosunSwitch(GeosunBaseEntity, SwitchEntity):
    """Representation of Geosun switch."""

    def __init__(
        self,
        runtime: GeosunRuntimeData,
        description: GeosunEntityDescription,
        unique_prefix: str,
    ) -> None:
        super().__init__(runtime, description, unique_prefix)
        self._attr_device_class = (
            SwitchDeviceClass(description.device_class) if description.device_class else None
        )

    @property
    def _payload_on(self) -> Any:
        payload = self.geosun_description.payload_on
        return 1 if payload is None else payload

    @property
    def _payload_off(self) -> Any:
        payload = self.geosun_description.payload_off
        return 0 if payload is None else payload

    @property
    def is_on(self) -> bool | None:
        """Return current state."""
        raw = self._raw_value
        if raw is None:
            return None
        return str(raw) == str(self._payload_on)

    async def async_turn_on(self, **kwargs: Any) -> None:
        """Turn entity on."""
        await self._async_write_value(self._payload_on)

    async def async_turn_off(self, **kwargs: Any) -> None:
        """Turn entity off."""
        await self._async_write_value(self._payload_off)

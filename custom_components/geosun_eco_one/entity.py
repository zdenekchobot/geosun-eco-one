"""Base entities for Geosun Eco One."""

from __future__ import annotations

from typing import Any

from homeassistant.exceptions import HomeAssistantError
from homeassistant.helpers.update_coordinator import CoordinatorEntity
from homeassistant.util import slugify

from . import GeosunRuntimeData
from .coordinator import GeosunDataUpdateCoordinator
from .entity_definitions import GeosunEntityDescription
from .geosun_client import GeosunClientError


class GeosunBaseEntity(CoordinatorEntity[GeosunDataUpdateCoordinator]):
    """Base class for all Geosun entities."""

    _attr_has_entity_name = True

    def __init__(
        self,
        runtime: GeosunRuntimeData,
        description: GeosunEntityDescription,
        unique_prefix: str,
    ) -> None:
        super().__init__(runtime.coordinator)
        self.geosun_description = description
        self._client = runtime.client

        self._attr_unique_id = f"{unique_prefix}_{description.object_id}"
        self._attr_device_info = runtime.device
        self._attr_name = description.name
        self._attr_icon = description.icon
        # Keep the entity_id the AppDaemon/MQTT setup used (`<kind>.<object_id>`),
        # so existing automations and dashboards keep working. Home Assistant
        # uses it only on first registration and only if it is free.
        self.entity_id = f"{description.kind}.{slugify(description.object_id)}"

    @property
    def _raw_value(self) -> str | None:
        return self.coordinator.data.get(self.geosun_description.value_key)

    async def _async_write_value(self, value: Any) -> None:
        """Write a value to the unit and show it in Home Assistant right away."""
        try:
            written = await self._client.async_set_value(self.geosun_description, value)
        except GeosunClientError as err:
            await self.coordinator.async_request_refresh()
            raise HomeAssistantError(
                f"Failed to write {self.geosun_description.object_id}: {err}"
            ) from err
        self.coordinator.async_value_written(self.geosun_description.value_key, written)

"""Base entities for Geosun Eco One."""

from __future__ import annotations

from homeassistant.helpers.device_registry import DeviceInfo
from homeassistant.helpers.update_coordinator import CoordinatorEntity

from .coordinator import GeosunDataUpdateCoordinator
from .entity_definitions import GeosunEntityDescription


class GeosunBaseEntity(CoordinatorEntity[GeosunDataUpdateCoordinator]):
    """Base class for all Geosun entities."""

    _attr_has_entity_name = False

    def __init__(
        self,
        coordinator: GeosunDataUpdateCoordinator,
        description: GeosunEntityDescription,
        device: DeviceInfo,
        unique_prefix: str,
    ) -> None:
        super().__init__(coordinator)
        self.geosun_description = description
        self._device = device

        self._attr_unique_id = f"{unique_prefix}_{description.object_id}"
        self._attr_suggested_object_id = description.object_id
        self._attr_name = description.name
        self._attr_icon = description.icon

    @property
    def device_info(self) -> DeviceInfo:
        """Return device metadata."""
        return self._device

    @property
    def _raw_value(self) -> str | None:
        return self.coordinator.data.get(self.geosun_description.value_key)

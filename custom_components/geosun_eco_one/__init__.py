"""The Geosun Eco One integration."""

from __future__ import annotations

from dataclasses import dataclass

from homeassistant.config_entries import ConfigEntry
from homeassistant.const import CONF_PASSWORD, CONF_USERNAME
from homeassistant.core import HomeAssistant
from homeassistant.helpers.device_registry import DeviceInfo

from .const import (
    CONF_ADDITIONAL_ENTITIES,
    CONF_DEVICE_ID,
    CONF_DEVICE_MANUFACTURER,
    CONF_DEVICE_MODEL,
    CONF_DEVICE_NAME,
    CONF_ENABLED_DEFAULT_ENTITIES,
    CONF_HOST,
    CONF_SCAN_INTERVAL,
    DOMAIN,
    PLATFORMS,
)
from .coordinator import GeosunDataUpdateCoordinator
from .entity_definitions import GeosunEntityDescription, build_entity_definitions
from .geosun_client import GeosunClient


@dataclass
class GeosunRuntimeData:
    """Objects shared by all platforms of one config entry."""

    client: GeosunClient
    coordinator: GeosunDataUpdateCoordinator
    entities: dict[str, GeosunEntityDescription]
    device: DeviceInfo


type GeosunConfigEntry = ConfigEntry[GeosunRuntimeData]


async def async_setup_entry(hass: HomeAssistant, entry: GeosunConfigEntry) -> bool:
    """Set up Geosun Eco One from a config entry."""
    options = entry.options
    entity_definitions = build_entity_definitions(
        options.get(CONF_ENABLED_DEFAULT_ENTITIES),
        options.get(CONF_ADDITIONAL_ENTITIES, ""),
    )

    client = GeosunClient(
        host=entry.data[CONF_HOST],
        username=entry.data[CONF_USERNAME],
        password=entry.data[CONF_PASSWORD],
    )

    coordinator = GeosunDataUpdateCoordinator(
        hass=hass,
        config_entry=entry,
        client=client,
        entity_definitions=entity_definitions,
        scan_interval=options.get(CONF_SCAN_INTERVAL, entry.data[CONF_SCAN_INTERVAL]),
    )
    # Entities must not be created before the first data arrives; on failure
    # this raises ConfigEntryNotReady (retry later) or ConfigEntryAuthFailed (reauth).
    await coordinator.async_config_entry_first_refresh()

    entry.runtime_data = GeosunRuntimeData(
        client=client,
        coordinator=coordinator,
        entities=entity_definitions,
        device=DeviceInfo(
            identifiers={(DOMAIN, entry.data[CONF_DEVICE_ID])},
            name=entry.data[CONF_DEVICE_NAME],
            model=entry.data.get(CONF_DEVICE_MODEL),
            manufacturer=entry.data.get(CONF_DEVICE_MANUFACTURER),
        ),
    )

    await hass.config_entries.async_forward_entry_setups(entry, PLATFORMS)
    entry.async_on_unload(entry.add_update_listener(_async_update_listener))
    return True


async def async_unload_entry(hass: HomeAssistant, entry: GeosunConfigEntry) -> bool:
    """Unload a config entry."""
    return await hass.config_entries.async_unload_platforms(entry, PLATFORMS)


async def _async_update_listener(hass: HomeAssistant, entry: GeosunConfigEntry) -> None:
    """Reload the entry after its options change."""
    await hass.config_entries.async_reload(entry.entry_id)

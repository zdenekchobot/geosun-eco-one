"""The Geosun Eco One integration."""

from __future__ import annotations

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
from .entity_definitions import build_entity_definitions
from .geosun_client import GeosunClient


async def async_setup_entry(hass: HomeAssistant, entry: ConfigEntry) -> bool:
    """Set up Geosun Eco One from a config entry."""
    host = entry.data[CONF_HOST]
    username = entry.data[CONF_USERNAME]
    password = entry.data[CONF_PASSWORD]

    options = entry.options
    enabled_defaults = options.get(CONF_ENABLED_DEFAULT_ENTITIES)
    additional_entities = options.get(CONF_ADDITIONAL_ENTITIES, "")
    scan_interval = options.get(CONF_SCAN_INTERVAL, entry.data[CONF_SCAN_INTERVAL])

    entity_definitions = build_entity_definitions(enabled_defaults, additional_entities)

    client = GeosunClient(
        host=host,
        username=username,
        password=password,
    )

    device = DeviceInfo(
        identifiers={(DOMAIN, entry.data[CONF_DEVICE_ID])},
        name=entry.data[CONF_DEVICE_NAME],
        model=entry.data.get(CONF_DEVICE_MODEL),
        manufacturer=entry.data.get(CONF_DEVICE_MANUFACTURER),
    )

    coordinator = GeosunDataUpdateCoordinator(
        hass=hass,
        client=client,
        entity_definitions=entity_definitions,
        scan_interval=scan_interval,
    )

    hass.data.setdefault(DOMAIN, {})[entry.entry_id] = {
        "client": client,
        "coordinator": coordinator,
        "entities": entity_definitions,
        "device": device,
    }

    await hass.config_entries.async_forward_entry_setups(entry, PLATFORMS)
    await coordinator.async_refresh()
    entry.async_on_unload(entry.add_update_listener(async_reload_entry))
    return True


async def async_unload_entry(hass: HomeAssistant, entry: ConfigEntry) -> bool:
    """Unload a config entry."""
    unload_ok = await hass.config_entries.async_unload_platforms(entry, PLATFORMS)
    if unload_ok:
        hass.data[DOMAIN].pop(entry.entry_id)
    return unload_ok


async def async_reload_entry(hass: HomeAssistant, entry: ConfigEntry) -> None:
    """Reload config entry."""
    await async_unload_entry(hass, entry)
    await async_setup_entry(hass, entry)

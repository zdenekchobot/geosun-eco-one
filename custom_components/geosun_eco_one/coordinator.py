"""Data coordinator for Geosun Eco One."""

from __future__ import annotations

import logging
from datetime import timedelta

from homeassistant.config_entries import ConfigEntry
from homeassistant.core import CALLBACK_TYPE, HomeAssistant
from homeassistant.exceptions import ConfigEntryAuthFailed
from homeassistant.helpers.event import async_call_later
from homeassistant.helpers.update_coordinator import (
    DataUpdateCoordinator,
    UpdateFailed,
)

from .const import MIN_SCAN_INTERVAL
from .entity_definitions import GeosunEntityDescription
from .geosun_client import GeosunAuthenticationError, GeosunClient, GeosunClientError

_LOGGER = logging.getLogger(__name__)

# Delay before re-reading the unit after a write, so the read confirms the
# applied value instead of possibly catching the previous one.
VERIFY_DELAY = 3


class GeosunDataUpdateCoordinator(DataUpdateCoordinator[dict[str, str]]):
    """Coordinator for pulling all configured Geosun values."""

    def __init__(
        self,
        hass: HomeAssistant,
        config_entry: ConfigEntry,
        client: GeosunClient,
        entity_definitions: dict[str, GeosunEntityDescription],
        scan_interval: int,
    ) -> None:
        self.client = client
        self.entity_definitions = entity_definitions
        self._unsub_verify: CALLBACK_TYPE | None = None

        super().__init__(
            hass,
            _LOGGER,
            config_entry=config_entry,
            name="Geosun Eco One",
            update_interval=timedelta(seconds=max(scan_interval, MIN_SCAN_INTERVAL)),
        )

    def async_value_written(self, value_key: str, value: str) -> None:
        """Show a successfully written value at once, then confirm it from the unit."""
        self.async_set_updated_data({**(self.data or {}), value_key: value})
        if self._unsub_verify:
            self._unsub_verify()
        self._unsub_verify = async_call_later(self.hass, VERIFY_DELAY, self._async_verify)

    async def _async_verify(self, _now: object) -> None:
        self._unsub_verify = None
        await self.async_refresh()

    async def async_shutdown(self) -> None:
        """Cancel a pending verification read."""
        if self._unsub_verify:
            self._unsub_verify()
            self._unsub_verify = None
        await super().async_shutdown()

    async def _async_update_data(self) -> dict[str, str]:
        try:
            return await self.client.async_fetch_values(self.entity_definitions)
        except GeosunAuthenticationError as err:
            raise ConfigEntryAuthFailed(str(err)) from err
        except GeosunClientError as err:
            raise UpdateFailed(str(err)) from err

"""Data coordinator for Geosun Eco One."""

from __future__ import annotations

import logging
from datetime import timedelta

from homeassistant.core import HomeAssistant
from homeassistant.helpers.update_coordinator import (
    DataUpdateCoordinator,
    UpdateFailed,
)

from .const import MIN_SCAN_INTERVAL
from .entity_definitions import GeosunEntityDescription
from .geosun_client import GeosunAuthenticationError, GeosunClient, GeosunClientError

_LOGGER = logging.getLogger(__name__)


class GeosunDataUpdateCoordinator(DataUpdateCoordinator[dict[str, str]]):
    """Coordinator for pulling all configured Geosun values."""

    def __init__(
        self,
        hass: HomeAssistant,
        client: GeosunClient,
        entity_definitions: dict[str, GeosunEntityDescription],
        scan_interval: int,
    ) -> None:
        self.client = client
        self.entity_definitions = entity_definitions

        super().__init__(
            hass,
            _LOGGER,
            name="Geosun Eco One",
            update_interval=timedelta(seconds=max(scan_interval, MIN_SCAN_INTERVAL)),
        )

    async def _async_update_data(self) -> dict[str, str]:
        try:
            return await self.client.async_fetch_values(self.entity_definitions)
        except GeosunAuthenticationError as err:
            raise UpdateFailed(f"Authentication failed: {err}") from err
        except GeosunClientError as err:
            raise UpdateFailed(str(err)) from err

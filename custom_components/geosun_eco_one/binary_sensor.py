"""Binary sensor platform for Geosun Eco One."""

from __future__ import annotations

from homeassistant.components.binary_sensor import BinarySensorEntity
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
    """Set up Geosun binary sensors."""
    runtime = hass.data[DOMAIN][entry.entry_id]
    entities: dict[str, GeosunEntityDescription] = runtime["entities"]

    async_add_entities(
        GeosunBinarySensor(runtime["coordinator"], description, runtime["device"], entry.entry_id)
        for description in entities.values()
        if description.kind == "binary_sensor"
    )


class GeosunBinarySensor(GeosunBaseEntity, BinarySensorEntity):
    """Representation of a Geosun binary sensor."""

    @property
    def is_on(self) -> bool | None:
        """Return current state."""
        raw = self._raw_value
        if raw is None:
            return None

        if self.geosun_description.payload_on is None:
            return raw not in {"0", "false", "False", ""}

        return str(raw) == str(self.geosun_description.payload_on)

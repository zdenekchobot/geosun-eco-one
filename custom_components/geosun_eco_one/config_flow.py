"""Config flow for Geosun Eco One integration."""

from __future__ import annotations

from typing import Any

import voluptuous as vol

from homeassistant import config_entries
from homeassistant.const import CONF_PASSWORD, CONF_USERNAME
from homeassistant.core import callback
from homeassistant.data_entry_flow import FlowResult
from homeassistant.helpers import config_validation as cv, selector

from .const import (
    CONF_ADDITIONAL_ENTITIES,
    CONF_DEVICE_ID,
    CONF_DEVICE_MANUFACTURER,
    CONF_DEVICE_MODEL,
    CONF_DEVICE_NAME,
    CONF_ENABLED_DEFAULT_ENTITIES,
    CONF_HOST,
    CONF_SCAN_INTERVAL,
    DEFAULT_DEVICE_MANUFACTURER,
    DEFAULT_DEVICE_MODEL,
    DEFAULT_SCAN_INTERVAL,
    DOMAIN,
    MIN_SCAN_INTERVAL,
)
from .entity_definitions import DEFAULT_ENTITIES, parse_additional_entities
from .geosun_client import GeosunAuthenticationError, GeosunClient, GeosunClientError


def _user_schema(defaults: dict[str, Any] | None = None) -> vol.Schema:
    defaults = defaults or {}
    return vol.Schema(
        {
            vol.Required(CONF_HOST, default=defaults.get(CONF_HOST, "")): str,
            vol.Required(CONF_USERNAME, default=defaults.get(CONF_USERNAME, "")): str,
            vol.Required(CONF_PASSWORD, default=defaults.get(CONF_PASSWORD, "")): str,
            vol.Required(
                CONF_SCAN_INTERVAL,
                default=defaults.get(CONF_SCAN_INTERVAL, DEFAULT_SCAN_INTERVAL),
            ): vol.All(vol.Coerce(int), vol.Range(min=MIN_SCAN_INTERVAL)),
            vol.Required(CONF_DEVICE_ID, default=defaults.get(CONF_DEVICE_ID, "geosun-eco-one")): str,
            vol.Required(CONF_DEVICE_NAME, default=defaults.get(CONF_DEVICE_NAME, "Geosun Eco One")): str,
            vol.Required(
                CONF_DEVICE_MODEL,
                default=defaults.get(CONF_DEVICE_MODEL, DEFAULT_DEVICE_MODEL),
            ): str,
            vol.Required(
                CONF_DEVICE_MANUFACTURER,
                default=defaults.get(CONF_DEVICE_MANUFACTURER, DEFAULT_DEVICE_MANUFACTURER),
            ): str,
        }
    )


def _options_schema(config_entry: config_entries.ConfigEntry) -> vol.Schema:
    defaults = config_entry.options
    default_enabled = defaults.get(CONF_ENABLED_DEFAULT_ENTITIES, list(DEFAULT_ENTITIES.keys()))

    return vol.Schema(
        {
            vol.Required(
                CONF_SCAN_INTERVAL,
                default=defaults.get(CONF_SCAN_INTERVAL, config_entry.data[CONF_SCAN_INTERVAL]),
            ): vol.All(vol.Coerce(int), vol.Range(min=MIN_SCAN_INTERVAL)),
            vol.Required(CONF_ENABLED_DEFAULT_ENTITIES, default=default_enabled): cv.multi_select(
                {key: definition.name for key, definition in DEFAULT_ENTITIES.items()}
            ),
            vol.Optional(
                CONF_ADDITIONAL_ENTITIES,
                default=defaults.get(CONF_ADDITIONAL_ENTITIES, ""),
            ): selector.TextSelector(selector.TextSelectorConfig(multiline=True)),
        }
    )


class GeosunConfigFlow(config_entries.ConfigFlow, domain=DOMAIN):
    """Handle a config flow for Geosun Eco One."""

    VERSION = 1

    async def async_step_user(self, user_input: dict[str, Any] | None = None) -> FlowResult:
        """Handle the initial step."""
        errors: dict[str, str] = {}

        if user_input is not None:
            await self.async_set_unique_id(user_input[CONF_HOST])
            self._abort_if_unique_id_configured()

            try:
                client = GeosunClient(
                    host=user_input[CONF_HOST],
                    username=user_input[CONF_USERNAME],
                    password=user_input[CONF_PASSWORD],
                )
                await client.async_test_connection()
            except GeosunAuthenticationError:
                errors["base"] = "invalid_auth"
            except GeosunClientError:
                errors["base"] = "cannot_connect"
            except Exception:  # noqa: BLE001
                errors["base"] = "unknown"

            if not errors:
                return self.async_create_entry(
                    title=user_input[CONF_DEVICE_NAME],
                    data=user_input,
                )

        return self.async_show_form(
            step_id="user",
            data_schema=_user_schema(user_input),
            errors=errors,
        )

    @staticmethod
    @callback
    def async_get_options_flow(config_entry: config_entries.ConfigEntry) -> GeosunOptionsFlow:
        """Get options flow handler."""
        return GeosunOptionsFlow(config_entry)


class GeosunOptionsFlow(config_entries.OptionsFlow):
    """Handle Geosun options."""

    def __init__(self, config_entry: config_entries.ConfigEntry) -> None:
        self._config_entry = config_entry

    async def async_step_init(self, user_input: dict[str, Any] | None = None) -> FlowResult:
        """Manage options."""
        errors: dict[str, str] = {}

        if user_input is not None:
            try:
                parse_additional_entities(user_input.get(CONF_ADDITIONAL_ENTITIES, ""))
            except ValueError:
                errors[CONF_ADDITIONAL_ENTITIES] = "invalid_additional_entities"

            if not errors:
                return self.async_create_entry(title="", data=user_input)

        return self.async_show_form(
            step_id="init",
            data_schema=_options_schema(self._config_entry),
            errors=errors,
        )

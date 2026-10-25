"""Config flow for Geosun Eco One integration."""

from __future__ import annotations

from collections.abc import Mapping
from typing import Any

import voluptuous as vol

from homeassistant.config_entries import (
    ConfigEntry,
    ConfigFlow,
    ConfigFlowResult,
    OptionsFlow,
)
from homeassistant.const import CONF_PASSWORD, CONF_USERNAME
from homeassistant.core import callback
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
from .geosun_client import (
    GeosunAuthenticationError,
    GeosunClient,
    GeosunClientError,
    normalize_base_url,
)

_PASSWORD_SELECTOR = selector.TextSelector(
    selector.TextSelectorConfig(type=selector.TextSelectorType.PASSWORD)
)


def _user_schema(defaults: dict[str, Any] | None = None) -> vol.Schema:
    defaults = defaults or {}
    return vol.Schema(
        {
            vol.Required(CONF_HOST, default=defaults.get(CONF_HOST, "")): str,
            vol.Required(CONF_USERNAME, default=defaults.get(CONF_USERNAME, "")): str,
            vol.Required(CONF_PASSWORD, default=defaults.get(CONF_PASSWORD, "")): _PASSWORD_SELECTOR,
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


def _options_schema(config_entry: ConfigEntry, defaults: Mapping[str, Any]) -> vol.Schema:
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


async def _async_validate_login(host: str, username: str, password: str) -> str | None:
    """Try to log in; return an error key or None on success."""
    try:
        await GeosunClient(host=host, username=username, password=password).async_test_connection()
    except GeosunAuthenticationError:
        return "invalid_auth"
    except GeosunClientError:
        return "cannot_connect"
    except Exception:  # noqa: BLE001
        return "unknown"
    return None


class GeosunConfigFlow(ConfigFlow, domain=DOMAIN):
    """Handle a config flow for Geosun Eco One."""

    VERSION = 1

    async def async_step_user(self, user_input: dict[str, Any] | None = None) -> ConfigFlowResult:
        """Handle the initial step."""
        errors: dict[str, str] = {}

        if user_input is not None:
            try:
                unique_id = normalize_base_url(user_input[CONF_HOST])
            except GeosunClientError:
                errors[CONF_HOST] = "invalid_host"
            else:
                await self.async_set_unique_id(unique_id)
                self._abort_if_unique_id_configured()

                if error := await _async_validate_login(
                    user_input[CONF_HOST], user_input[CONF_USERNAME], user_input[CONF_PASSWORD]
                ):
                    errors["base"] = error
                else:
                    return self.async_create_entry(
                        title=user_input[CONF_DEVICE_NAME],
                        data=user_input,
                    )

        return self.async_show_form(
            step_id="user",
            data_schema=_user_schema(user_input),
            errors=errors,
        )

    async def async_step_reauth(self, entry_data: Mapping[str, Any]) -> ConfigFlowResult:
        """Start reauthentication after the unit rejected the credentials."""
        return await self.async_step_reauth_confirm()

    async def async_step_reauth_confirm(
        self, user_input: dict[str, Any] | None = None
    ) -> ConfigFlowResult:
        """Ask for new credentials."""
        entry = self._get_reauth_entry()
        errors: dict[str, str] = {}

        if user_input is not None:
            if error := await _async_validate_login(
                entry.data[CONF_HOST], user_input[CONF_USERNAME], user_input[CONF_PASSWORD]
            ):
                errors["base"] = error
            else:
                return self.async_update_reload_and_abort(entry, data_updates=user_input)

        return self.async_show_form(
            step_id="reauth_confirm",
            data_schema=vol.Schema(
                {
                    vol.Required(CONF_USERNAME, default=entry.data[CONF_USERNAME]): str,
                    vol.Required(CONF_PASSWORD): _PASSWORD_SELECTOR,
                }
            ),
            description_placeholders={"host": entry.data[CONF_HOST]},
            errors=errors,
        )

    @staticmethod
    @callback
    def async_get_options_flow(config_entry: ConfigEntry) -> GeosunOptionsFlow:
        """Get options flow handler."""
        return GeosunOptionsFlow()


class GeosunOptionsFlow(OptionsFlow):
    """Handle Geosun options."""

    async def async_step_init(self, user_input: dict[str, Any] | None = None) -> ConfigFlowResult:
        """Manage options."""
        errors: dict[str, str] = {}
        placeholders = {"error": ""}

        if user_input is not None:
            try:
                parse_additional_entities(user_input.get(CONF_ADDITIONAL_ENTITIES, ""))
            except ValueError as err:
                errors[CONF_ADDITIONAL_ENTITIES] = "invalid_additional_entities"
                placeholders["error"] = str(err)
            else:
                return self.async_create_entry(data=user_input)

        return self.async_show_form(
            step_id="init",
            data_schema=_options_schema(self.config_entry, user_input or self.config_entry.options),
            errors=errors,
            description_placeholders=placeholders,
        )

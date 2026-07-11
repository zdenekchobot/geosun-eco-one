"""Constants for the Geosun Eco One integration."""

from __future__ import annotations

from datetime import timedelta

DOMAIN = "geosun_eco_one"

CONF_HOST = "host"
CONF_USERNAME = "username"
CONF_PASSWORD = "password"
CONF_SCAN_INTERVAL = "scan_interval"
CONF_DEVICE_ID = "device_id"
CONF_DEVICE_NAME = "device_name"
CONF_DEVICE_MODEL = "device_model"
CONF_DEVICE_MANUFACTURER = "device_manufacturer"
CONF_ENABLED_DEFAULT_ENTITIES = "enabled_default_entities"
CONF_ADDITIONAL_ENTITIES = "additional_entities"

DEFAULT_SCAN_INTERVAL = 30
MIN_SCAN_INTERVAL = 15

DEFAULT_DEVICE_MODEL = "Eco One"
DEFAULT_DEVICE_MANUFACTURER = "GEOSUN"

PLATFORMS = ["sensor", "binary_sensor", "switch", "number", "text"]

UPDATE_TIMEOUT = timedelta(seconds=15)

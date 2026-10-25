"""Tests for the HTTP/XML client."""

from __future__ import annotations

import asyncio

import pytest

from custom_components.geosun_eco_one.entity_definitions import DEFAULT_ENTITIES
from custom_components.geosun_eco_one.geosun_client import (
    GeosunAuthenticationError,
    GeosunClient,
    GeosunClientError,
    format_value,
    normalize_base_url,
    parse_page_values,
)

from .conftest import FIXTURES, PASSWORD, USERNAME


def test_every_default_entity_is_on_its_page() -> None:
    """Each default entity's key exists on the saved page it points to."""
    pages = {path.name: parse_page_values(path.read_bytes()) for path in FIXTURES.glob("*.XML")}
    missing = [
        key
        for key, entity in DEFAULT_ENTITIES.items()
        if entity.value_key not in pages.get(entity.page, {})
    ]
    assert missing == []


def test_parse_windows_1250_page() -> None:
    values = parse_page_values((FIXTURES / "PAGE144.XML").read_bytes())
    assert values["__TDF2423B2_REAL_.1f"] == "32.0"
    assert values["__T324BA0AB_TIME_Thh:mm"] == "16:00"


def test_parse_invalid_xml() -> None:
    with pytest.raises(GeosunClientError):
        parse_page_values(b"?xml version='1.0' ?><PAGE>")


@pytest.mark.parametrize(
    ("value_key", "value", "expected"),
    [
        ("__TE5A77326_BOOL_i", True, "1"),
        ("__TE5A77326_BOOL_i", 0, "0"),
        ("__TE5A77326_BOOL_i", "1", "1"),
        ("__TE5A77326_BOOL_i", "off", "0"),
        ("__TDF2423B2_REAL_.1f", 45, "45.0"),
        ("__TDF2423B2_REAL_.1f", 45.06, "45.1"),
        ("__TA2C9CFCD_REAL_.2f", "6.6", "6.60"),
        ("__TF7A12A3D_REAL_.0f", 39.4, "39"),
        ("__T324BA0AB_TIME_Thh:mm", "6:05", "06:05"),
        ("__T324BA0AB_TIME_Thh:mm", "21:30", "21:30"),
        ("__TUNKNOWN_FOO", "abc", "abc"),
    ],
)
def test_format_value(value_key: str, value: object, expected: str) -> None:
    assert format_value(value_key, value) == expected


@pytest.mark.parametrize(
    ("value_key", "value"),
    [("__TDF2423B2_REAL_.1f", "warm"), ("__T324BA0AB_TIME_Thh:mm", "24:00")],
)
def test_format_value_invalid(value_key: str, value: object) -> None:
    with pytest.raises(GeosunClientError):
        format_value(value_key, value)


@pytest.mark.parametrize(
    ("host", "expected"),
    [
        ("192.168.1.50", "http://192.168.1.50"),
        (" 192.168.1.50:8080 ", "http://192.168.1.50:8080"),
        ("http://192.168.1.50/LOGIN.XML", "http://192.168.1.50"),
        ("https://eco.local", "https://eco.local"),
    ],
)
def test_normalize_base_url(host: str, expected: str) -> None:
    assert normalize_base_url(host) == expected


@pytest.mark.parametrize("host", ["", "   ", "http://", "1.2.3.4:notaport"])
def test_normalize_base_url_invalid(host: str) -> None:
    with pytest.raises(GeosunClientError):
        normalize_base_url(host)


async def test_fetch_values(fake_unit) -> None:
    client = GeosunClient(fake_unit.host, USERNAME, PASSWORD)
    values = await client.async_fetch_values(DEFAULT_ENTITIES)

    assert values["__TF9DCC3BC_REAL_.1f"] == "29.9"
    assert values["__TFF513049_REAL_.1f"] == "5.3"
    assert fake_unit.logins == fake_unit.logouts == 1


async def test_wrong_password(fake_unit) -> None:
    client = GeosunClient(fake_unit.host, USERNAME, "wrong")
    with pytest.raises(GeosunAuthenticationError):
        await client.async_test_connection()


async def test_unreachable_unit(socket_enabled) -> None:
    client = GeosunClient("127.0.0.1:9", USERNAME, PASSWORD)
    with pytest.raises(GeosunClientError):
        await client.async_test_connection()


async def test_write_formats_value(fake_unit) -> None:
    client = GeosunClient(fake_unit.host, USERNAME, PASSWORD)
    await client.async_set_value(DEFAULT_ENTITIES["DHW_temperature_setting"], 45)
    await client.async_set_value(DEFAULT_ENTITIES["dhw_heater_setting"], 0)

    assert fake_unit.posts == [
        ("PAGE144.XML", {"__TDF2423B2_REAL_.1f": "45.0"}),
        ("PAGE143.XML", {"__TE5A77326_BOOL_i": "0"}),
    ]
    assert fake_unit.logins == fake_unit.logouts == 2


async def test_write_rejected_by_expired_session(fake_unit) -> None:
    fake_unit.expire_sessions_on_post = True
    client = GeosunClient(fake_unit.host, USERNAME, PASSWORD)
    with pytest.raises(GeosunAuthenticationError):
        await client.async_set_value(DEFAULT_ENTITIES["dhw_heater_setting"], 1)


async def test_operations_never_overlap(fake_unit) -> None:
    """A write during a poll must wait, the unit allows few sessions."""
    client = GeosunClient(fake_unit.host, USERNAME, PASSWORD)
    await asyncio.gather(
        client.async_fetch_values(DEFAULT_ENTITIES),
        client.async_set_value(DEFAULT_ENTITIES["dhw_heater_plan"], 1),
        client.async_fetch_values(DEFAULT_ENTITIES),
    )
    assert fake_unit.max_concurrent_sessions == 1
    assert fake_unit.logins == fake_unit.logouts == 3

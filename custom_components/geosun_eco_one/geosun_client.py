"""API client for GEOSUN Eco One unit."""

from __future__ import annotations

import asyncio
import re
import xml.etree.ElementTree as ET
from typing import Any
from urllib.parse import urlsplit

from aiohttp import ClientError, ClientResponse, ClientSession, ClientTimeout, CookieJar, TCPConnector

from .entity_definitions import GeosunEntityDescription

_REAL_FORMAT = re.compile(r"_REAL_\.(\d+)f$")
_TIME_VALUE = re.compile(r"^([01]?\d|2[0-3]):([0-5]\d)$")


class GeosunClientError(Exception):
    """Base GEOSUN client error."""


class GeosunAuthenticationError(GeosunClientError):
    """Authentication failed."""


def normalize_base_url(host: str) -> str:
    """Normalize host input to a valid base URL.

    Accepts either plain host/IP (with optional port) or full URL.
    """
    candidate = host.strip()
    if not candidate:
        raise GeosunClientError("Host is empty")

    if "://" not in candidate:
        candidate = f"http://{candidate}"

    parsed = urlsplit(candidate)
    try:
        hostname = parsed.hostname
        port = parsed.port
    except ValueError as err:
        raise GeosunClientError("Invalid host") from err
    if not hostname:
        raise GeosunClientError("Invalid host")

    netloc = hostname if port is None else f"{hostname}:{port}"
    return f"{parsed.scheme or 'http'}://{netloc}"


def format_value(value_key: str, value: Any) -> str:
    """Format a value for writing, according to the type encoded in the key.

    Keys look like `__TDF2423B2_REAL_.1f`, `__TE5A77326_BOOL_i` or
    `__T324BA0AB_TIME_Thh:mm`.
    """
    if "_BOOL_" in value_key:
        if isinstance(value, str):
            value = value.strip().lower() in {"1", "true", "on"}
        return "1" if value else "0"

    if match := _REAL_FORMAT.search(value_key):
        try:
            number = float(value)
        except (TypeError, ValueError) as err:
            raise GeosunClientError(f"Value {value!r} is not a number") from err
        return f"{number:.{int(match.group(1))}f}"

    if "_TIME_" in value_key:
        match = _TIME_VALUE.match(str(value).strip())
        if not match:
            raise GeosunClientError(f"Value {value!r} is not a time in HH:MM format")
        return f"{int(match.group(1)):02d}:{match.group(2)}"

    return str(value)


def parse_page_values(body: bytes, page: str = "page") -> dict[str, str]:
    """Extract INPUT name/value pairs from a GEOSUN XML page."""
    try:
        root = ET.fromstring(body)
    except ET.ParseError as err:
        raise GeosunClientError(f"Invalid XML response from {page}") from err

    values: dict[str, str] = {}
    for node in root.iter("INPUT"):
        name = node.attrib.get("NAME")
        value = node.attrib.get("VALUE")
        if name is not None and value is not None:
            values[name] = value
    return values


class GeosunClient:
    """HTTP client for GEOSUN Eco One.

    The unit allows only a few concurrent web sessions, so every operation
    logs in, does its work and logs out, and operations never overlap.
    """

    def __init__(self, host: str, username: str, password: str) -> None:
        self._base_url = normalize_base_url(host)
        self._auth_payload = {"USER": username, "PASS": password}
        self._lock = asyncio.Lock()

    def _create_session(self) -> ClientSession:
        """Create an HTTP session compatible with GEOSUN web server."""
        return ClientSession(
            cookie_jar=CookieJar(unsafe=True),
            timeout=ClientTimeout(total=15),
            connector=TCPConnector(limit=1, force_close=True),
        )

    async def async_fetch_values(
        self,
        entities: dict[str, GeosunEntityDescription],
    ) -> dict[str, str]:
        """Fetch state values for provided entity definitions."""
        if not entities:
            return {}

        xml_pages = sorted({entity.page for entity in entities.values()})

        async with self._lock, self._create_session() as session:
            await self._async_login(session)
            try:
                values: dict[str, str] = {}
                for page in xml_pages:
                    values.update(await self._async_fetch_page_values(session, page))
                return values
            finally:
                await self._async_logout(session)

    async def async_set_value(
        self,
        entity: GeosunEntityDescription,
        value: Any,
    ) -> str:
        """Write one value to GEOSUN unit and return it as the unit reports it."""
        formatted = format_value(entity.value_key, value)
        payload = {entity.value_key: formatted}

        async with self._lock, self._create_session() as session:
            await self._async_login(session)
            try:
                response = await session.post(
                    f"{self._base_url}/{entity.page}",
                    data=payload,
                    allow_redirects=False,
                )
                self._raise_for_redirect(response, f"writing {entity.object_id}")
                response.raise_for_status()
            except ClientError as err:
                raise GeosunClientError(f"Failed to update value for {entity.object_id}") from err
            finally:
                await self._async_logout(session)
        return formatted

    async def async_test_connection(self) -> None:
        """Validate endpoint and credentials."""
        async with self._lock, self._create_session() as session:
            await self._async_login(session)
            await self._async_logout(session)

    async def _async_login(self, session: ClientSession) -> None:
        try:
            response = await session.post(
                f"{self._base_url}/",
                data=self._auth_payload,
                allow_redirects=False,
            )
            response.raise_for_status()
            body = (await response.text(errors="replace")).lower()
        except ClientError as err:
            raise GeosunClientError("Unable to connect to GEOSUN unit") from err

        # A successful login redirects to the start page PAGE159.XML,
        # a failed one back to LOGIN.XML.
        if 300 <= response.status < 400:
            location = response.headers.get("Location", "").lower()
            if "page159.xml" in location:
                return
            if "login.xml" in location:
                raise GeosunAuthenticationError("Unable to log in to GEOSUN unit")
            raise GeosunClientError("Unexpected redirect from GEOSUN unit")

        if "page159.xml" in body:
            return
        if "login.xml" in body:
            raise GeosunAuthenticationError("Unable to log in to GEOSUN unit")
        raise GeosunClientError("Unexpected response from GEOSUN unit")

    async def _async_logout(self, session: ClientSession) -> None:
        try:
            await session.get(f"{self._base_url}/LOGOUT.XML", allow_redirects=False)
        except ClientError:
            return

    @staticmethod
    def _raise_for_redirect(response: ClientResponse, action: str) -> None:
        if 300 <= response.status < 400:
            location = response.headers.get("Location", "").lower()
            if "login.xml" in location:
                raise GeosunAuthenticationError(f"Session expired while {action}")
            raise GeosunClientError(f"Unexpected redirect while {action}")

    async def _async_fetch_page_values(
        self,
        session: ClientSession,
        page: str,
    ) -> dict[str, str]:
        try:
            response = await session.get(f"{self._base_url}/{page}", allow_redirects=False)
            self._raise_for_redirect(response, f"fetching page {page}")
            response.raise_for_status()
            body = await response.read()
        except ClientError as err:
            raise GeosunClientError(f"Failed to fetch page {page}") from err

        return parse_page_values(body, page)

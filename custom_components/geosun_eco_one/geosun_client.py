"""API client for GEOSUN Eco One unit."""

from __future__ import annotations

import xml.etree.ElementTree as ET
from typing import Any
from urllib.parse import urlsplit

from aiohttp import ClientError, ClientSession, ClientTimeout, CookieJar, TCPConnector

from .entity_definitions import GeosunEntityDescription


class GeosunClientError(Exception):
    """Base GEOSUN client error."""


class GeosunAuthenticationError(GeosunClientError):
    """Authentication failed."""


class GeosunClient:
    """HTTP client for GEOSUN Eco One."""

    def __init__(self, host: str, username: str, password: str) -> None:
        self._base_url = self._normalize_base_url(host)
        self._auth_payload = {"USER": username, "PASS": password}

    def _create_session(self) -> ClientSession:
        """Create an HTTP session compatible with GEOSUN web server."""
        return ClientSession(
            cookie_jar=CookieJar(unsafe=True),
            timeout=ClientTimeout(total=15),
            connector=TCPConnector(limit=1, force_close=True),
        )

    @staticmethod
    def _normalize_base_url(host: str) -> str:
        """Normalize host input to a valid base URL.

        Accepts either plain host/IP (with optional port) or full URL.
        """
        candidate = host.strip()
        if not candidate:
            raise GeosunClientError("Host is empty")

        if "://" not in candidate:
            candidate = f"http://{candidate}"

        parsed = urlsplit(candidate)
        if not parsed.hostname:
            raise GeosunClientError("Invalid host")

        netloc = parsed.hostname
        if parsed.port is not None:
            netloc = f"{netloc}:{parsed.port}"

        scheme = parsed.scheme or "http"
        return f"{scheme}://{netloc}"

    async def async_fetch_values(
        self,
        entities: dict[str, GeosunEntityDescription],
    ) -> dict[str, str]:
        """Fetch state values for provided entity definitions."""
        if not entities:
            return {}

        xml_pages = {entity.page for entity in entities.values()}

        async with self._create_session() as session:
            await self._async_login(session)
            try:
                values: dict[str, str] = {}
                for page in xml_pages:
                    page_values = await self._async_fetch_page_values(session, page)
                    values.update(page_values)
                return values
            finally:
                await self._async_logout(session)

    async def async_set_value(
        self,
        entity: GeosunEntityDescription,
        value: Any,
    ) -> None:
        """Write one value to GEOSUN unit."""
        payload = {entity.value_key: value}

        async with self._create_session() as session:
            await self._async_login(session)
            try:
                url = f"{self._base_url}/{entity.page}"
                response = await session.post(url, data=payload)
                response.raise_for_status()
            except ClientError as err:
                raise GeosunClientError(f"Failed to update value for {entity.object_id}") from err
            finally:
                await self._async_logout(session)

    async def async_test_connection(self) -> None:
        """Validate endpoint and credentials."""
        async with self._create_session() as session:
            await self._async_login(session)
            try:
                return
            finally:
                await self._async_logout(session)

    async def _async_login(self, session: ClientSession) -> None:
        try:
            response = await session.post(
                self._base_url,
                data=self._auth_payload,
                allow_redirects=False,
            )
            response.raise_for_status()
        except ClientError as err:
            raise GeosunClientError("Unable to connect to GEOSUN unit") from err

        if 300 <= response.status < 400:
            location = response.headers.get("Location", "").lower()
            if "page159.xml" in location:
                return
            if "login.xml" in location:
                raise GeosunAuthenticationError("Unable to log in to GEOSUN unit")
            raise GeosunClientError("Unexpected redirect from GEOSUN unit")

        response_path = response.url.path.lower()
        if "page159.xml" in response_path:
            return

        body = (await response.text()).lower()
        if "page159.xml" in body:
            return

        if not response_path.endswith(".xml"):
            raise GeosunClientError("Unexpected response from GEOSUN unit")

        if "page159.xml" not in response_path:
            raise GeosunAuthenticationError("Unable to log in to GEOSUN unit")

    async def _async_logout(self, session: ClientSession) -> None:
        try:
            response = await session.get(
                f"{self._base_url}/LOGOUT.XML",
                allow_redirects=False,
            )
            if 300 <= response.status < 400:
                return
            response.raise_for_status()
            body = await response.text()
        except ClientError:
            return

        if "<LOGOUT>" not in body:
            return

    async def _async_fetch_page_values(
        self,
        session: ClientSession,
        page: str,
    ) -> dict[str, str]:
        url = f"{self._base_url}/{page}"
        try:
            response = await session.get(url, allow_redirects=False)
            if 300 <= response.status < 400:
                location = response.headers.get("Location", "").lower()
                if "login.xml" in location:
                    raise GeosunAuthenticationError("Session expired while fetching data")
                raise GeosunClientError(f"Unexpected redirect while fetching page {page}")
            response.raise_for_status()
            body = await response.text()
        except ClientError as err:
            raise GeosunClientError(f"Failed to fetch page {page}") from err

        try:
            root = ET.fromstring(body)
        except ET.ParseError as err:
            raise GeosunClientError(f"Invalid XML response from page {page}") from err

        values: dict[str, str] = {}
        for node in root.iter("INPUT"):
            name = node.attrib.get("NAME")
            value = node.attrib.get("VALUE")
            if name is None or value is None:
                continue
            values[name] = value

        return values

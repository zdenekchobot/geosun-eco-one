"""Shared fixtures: a fake GEOSUN unit serving the saved XML pages."""

from __future__ import annotations

from collections.abc import AsyncGenerator
from dataclasses import dataclass, field
from pathlib import Path
import secrets

from aiohttp import web
from aiohttp.test_utils import TestServer
import pytest

from custom_components.geosun_eco_one.const import (
    CONF_DEVICE_ID,
    CONF_DEVICE_MANUFACTURER,
    CONF_DEVICE_MODEL,
    CONF_DEVICE_NAME,
    CONF_HOST,
    CONF_SCAN_INTERVAL,
)
from homeassistant.const import CONF_PASSWORD, CONF_USERNAME

FIXTURES = Path(__file__).parent / "fixtures"
USERNAME = "user"
PASSWORD = "secret"


@pytest.fixture(autouse=True)
def auto_enable_custom_integrations(enable_custom_integrations):
    """Enable loading the integration from custom_components."""
    return


@dataclass
class FakeGeosun:
    """Minimal imitation of the TECO web server in the unit."""

    password: str = PASSWORD
    sessions: set[str] = field(default_factory=set)
    logins: int = 0
    logouts: int = 0
    max_concurrent_sessions: int = 0
    posts: list[tuple[str, dict[str, str]]] = field(default_factory=list)
    expire_sessions_on_post: bool = False
    host: str = ""

    def app(self) -> web.Application:
        app = web.Application()
        app.router.add_post("/", self._login)
        app.router.add_get("/LOGOUT.XML", self._logout)
        app.router.add_get("/{page}", self._get_page)
        app.router.add_post("/{page}", self._post_page)
        return app

    def _session(self, request: web.Request) -> str | None:
        sid = request.cookies.get("SID")
        return sid if sid in self.sessions else None

    async def _login(self, request: web.Request) -> web.Response:
        form = await request.post()
        if form.get("USER") != USERNAME or form.get("PASS") != self.password:
            raise web.HTTPFound("/LOGIN.XML")
        self.logins += 1
        sid = secrets.token_hex(8)
        self.sessions.add(sid)
        self.max_concurrent_sessions = max(self.max_concurrent_sessions, len(self.sessions))
        response = web.HTTPFound("/PAGE159.XML")
        response.set_cookie("SID", sid)
        raise response

    async def _logout(self, request: web.Request) -> web.Response:
        if sid := self._session(request):
            self.sessions.discard(sid)
            self.logouts += 1
        return web.Response(text="<LOGOUT></LOGOUT>", content_type="text/xml")

    async def _get_page(self, request: web.Request) -> web.Response:
        if not self._session(request):
            raise web.HTTPFound("/LOGIN.XML")
        path = FIXTURES / request.match_info["page"]
        if not path.is_file():
            raise web.HTTPNotFound()
        return web.Response(body=path.read_bytes(), content_type="text/xml")

    async def _post_page(self, request: web.Request) -> web.Response:
        if self.expire_sessions_on_post:
            self.sessions.clear()
        if not self._session(request):
            raise web.HTTPFound("/LOGIN.XML")
        form = await request.post()
        self.posts.append((request.match_info["page"], {k: str(v) for k, v in form.items()}))
        return web.Response(text="", content_type="text/xml")


@pytest.fixture
async def fake_unit(socket_enabled) -> AsyncGenerator[FakeGeosun]:
    """Run a fake unit on localhost."""
    unit = FakeGeosun()
    server = TestServer(unit.app(), host="127.0.0.1")
    await server.start_server()
    unit.host = f"127.0.0.1:{server.port}"
    yield unit
    await server.close()


def entry_data(host: str) -> dict:
    """Config entry data as created by the config flow."""
    return {
        CONF_HOST: host,
        CONF_USERNAME: USERNAME,
        CONF_PASSWORD: PASSWORD,
        CONF_SCAN_INTERVAL: 30,
        CONF_DEVICE_ID: "geosun-eco-one",
        CONF_DEVICE_NAME: "Eco",
        CONF_DEVICE_MODEL: "Eco One",
        CONF_DEVICE_MANUFACTURER: "GEOSUN",
    }

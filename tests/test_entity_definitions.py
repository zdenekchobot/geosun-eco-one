"""Tests for additional entities in YAML."""

from __future__ import annotations

import pytest

from custom_components.geosun_eco_one.entity_definitions import (
    DEFAULT_ENTITIES,
    build_entity_definitions,
    parse_additional_entities,
)

VALID = """
- object_id: pool_temperature
  page: PAGE210.XML
  value_key: __T12345678_REAL_.1f
  kind: sensor
  name: Pool temperature
  device_class: temperature
  unit: C
- object_id: pool_target
  page: PAGE210.XML
  value_key: __T87654321_REAL_.1f
  kind: number
  name: Pool target
  mode: slider
  min_value: 20
  max_value: 35
  step: 0.5
"""


def test_empty_yaml() -> None:
    assert parse_additional_entities("  \n") == []


def test_valid_yaml() -> None:
    sensor, number = parse_additional_entities(VALID)
    assert sensor.object_id == "pool_temperature"
    assert sensor.device_class == "temperature"
    assert number.step == 0.5


def test_build_merges_defaults_and_additions() -> None:
    entities = build_entity_definitions(["dhw_temperature"], VALID, list(DEFAULT_ENTITIES))
    assert set(entities) == {"dhw_temperature", "pool_temperature", "pool_target"}
    assert build_entity_definitions(None, "") == DEFAULT_ENTITIES


def test_new_defaults_follow_known_list() -> None:
    legacy_selection = sorted(set(DEFAULT_ENTITIES) - {"heat_pump_mode", "dhw_temperature"})

    # Options saved before heat_pump_mode existed: it is added.
    assert "heat_pump_mode" in build_entity_definitions(legacy_selection, "")
    # Options saved with it known but deselected: it stays off.
    known = list(DEFAULT_ENTITIES)
    entities = build_entity_definitions(legacy_selection, "", known)
    assert "heat_pump_mode" not in entities
    assert "dhw_temperature" not in entities


@pytest.mark.parametrize(
    ("text", "message"),
    [
        ("key: value", "YAML list"),
        ("- [1, 2]", "must be an object"),
        ("- {object_id: a, page: P.XML, value_key: k, kind: light, name: A}", "kind must be"),
        ("- {object_id: a b, page: P.XML, value_key: k, kind: sensor, name: A}", "object_id may"),
        ("- {object_id: a, page: P.XML, kind: sensor, name: A}", "value_key"),
        (
            "- {object_id: a, page: P.XML, value_key: k, kind: sensor, name: A, device_class: warm}",
            "device_class 'warm'",
        ),
        (
            "- {object_id: a, page: P.XML, value_key: k, kind: switch, name: A, state_class: total}",
            "state_class",
        ),
        (
            "- {object_id: a, page: P.XML, value_key: k, kind: number, name: A, mode: knob}",
            "mode must be",
        ),
        (
            "- {object_id: a, page: P.XML, value_key: k, kind: number, name: A, min_value: low}",
            "min_value",
        ),
        (
            "- {object_id: a, page: P.XML, value_key: k, kind: sensor, name: A}\n"
            "- {object_id: A, page: P.XML, value_key: k, kind: sensor, name: B}",
            "Duplicate object_id",
        ),
        ("- {object_id: [", "valid YAML"),
    ],
)
def test_invalid_yaml(text: str, message: str) -> None:
    with pytest.raises(ValueError, match=message):
        parse_additional_entities(text)

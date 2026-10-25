# Geosun Eco One - Home Assistant custom integration

Tato custom integrace komunikuje s jednotkou GEOSUN Eco One primo pres HTTP/XML (bez MQTT).
Nahrazuje puvodni AppDaemon aplikaci a zachovava jeji `entity_id`.

## Co umi

- Pripojit se na jednotku pomoci IP adresy, uzivatele a hesla.
- Pravidelne nacitat stavy z XML stranek jednotky.
- Vytvorit vychozi entity prevzate z puvodni AppDaemon aplikace, se stejnymi `entity_id`.
- Umoznit ovladani zapisovatelnych entit (`switch`, `number`, `text`). Zapis se overuje
  a hodnota se posila ve formatu, ktery jednotka ocekava (`45.0`, `1`/`0`, `06:30`).
- Umoznit jednoduche pridani vlastnich entit v `Options` jako YAML.
- Pri zmene hesla na jednotce nabidnout v HA zadani noveho hesla (reauth).
- Ukladat dlouhodobe statistiky ciselnych senzoru (`state_class: measurement`).

Jednotka povoli jen nekolik soubeznych webovych relaci, proto se integrace pri kazdem cteni
i zapisu prihlasi, provede praci a odhlasi se, a operace nikdy nebezi soubezne.

## Instalace

1. Zkopiruj slozku `custom_components/geosun_eco_one` do Home Assistant konfigurace.
2. Restartuj Home Assistant.
3. Pokud prechazis z AppDaemon/MQTT, nejdriv proved kroky z kapitoly [Prechod z AppDaemon/MQTT](#prechod-z-appdaemonmqtt).
4. V UI otevri `Settings -> Devices & services -> Add Integration`.
5. Vyhledej `Geosun Eco One` a vypln:
   - IP/hostname jednotky (napr. `192.168.1.50`, `192.168.1.50:80` i `http://192.168.1.50`)
   - uzivatel
   - heslo
   - interval aktualizace (minimalne 15 s)
   - metadata zarizeni

Vyzaduje Home Assistant 2025.2 nebo novejsi.

## Prechod z AppDaemon/MQTT

Integrace vytvari entity se stejnymi `entity_id` jako AppDaemon aplikace (`<typ>.<object_id>`,
napr. `sensor.dhw_temperature`, `number.dhw_temperature_setting`). Home Assistant ale prideli
`entity_id` jen pokud je volne. Kdyz stare MQTT entity zustanou v registru, nove dostanou
priponu `_2` a automatizace budou dal ukazovat na stare entity. Proto postupuj v tomto poradi:

1. **Zastav AppDaemon aplikaci** (odstran nebo zakomentuj `ecosun` v `apps.yaml`).
   Jinak by znovu publikovala MQTT discovery a stare entity by se vytvorily znovu.
2. **Smaz stare MQTT zarizeni**: `Settings -> Devices & services -> MQTT -> Devices`,
   otevri zarizeni (v AppDaemon konfiguraci `device_name`, napr. `Eco`) a zvol `Delete`.
   Tim se smazou i jeho entity.
3. **Over, ze stare entity zmizely**: v `Settings -> Entities` vyhledej napr. `dhw_temperature`.
   Nesmi tam zustat zadna entita, ani ve stavu `unavailable`/`not provided`.
4. **Pridej integraci** podle kapitoly Instalace.
5. **Zkontroluj** v `Settings -> Entities`, ze entity nemaji priponu `_2`. Pokud ano, smaz starou
   entitu a novou prejmenuj na puvodni `entity_id`.

Historie stavu navazuje, protoze je vazana na `entity_id`. Dlouhodobe statistiky zacnou nove,
protoze MQTT entity je neukladaly.

## Vychozi entity

Aktualne obsahuje 24 entit.

### Senzory

| entity_id | Nazev | Stranka a promenna |
|---|---|---|
| `sensor.dhw_temperature` | DHW temperature | PAGE196.XML, `__TF9DCC3BC_REAL_.1f` |
| `sensor.dhw_temperature_hysteresis` | DHW temperature hysteresis | PAGE144.XML, `__T0E14023C_REAL_.1f` |
| `sensor.hw_temperature` | HW temperature | PAGE133.XML, `__TF420903F_REAL_.1f` |
| `sensor.hw_target_temperature` | HW target temperature | PAGE133.XML, `__TB12A6D9A_REAL_.1f` |
| `sensor.heat_pump_power` | Heat pump power | PAGE196.XML, `__TA2C9CFCD_REAL_.2f` |
| `sensor.heat_pump_consumption` | Heat pump consumption | PAGE196.XML, `__T7816B7E5_REAL_.2f` |
| `sensor.heat_pump_cop` | Heat pump COP | PAGE196.XML, `__T1E26BB4F_REAL_.2f` |
| `sensor.heat_pump_relative_power` | Heat pump relative power | PAGE196.XML, `__TF7A12A3D_REAL_.0f` |
| `sensor.water_heater_in` | Water heater in | PAGE196.XML, `__T7FEC1C3B_REAL_.1f` |
| `sensor.water_heater_out` | Water heater out | PAGE196.XML, `__T20F39926_REAL_.1f` |
| `sensor.outside_temperature_now` | Outside temperature | PAGE183.XML, `__TFF513049_REAL_.1f` |

### Switche

| entity_id | Nazev | Stranka a promenna |
|---|---|---|
| `switch.hw_heater_setting` | HW heater setting | PAGE132.XML, `__TDE1D9B85_BOOL_i` |
| `switch.dhw_heater_setting` | DHW heater | PAGE143.XML, `__TE5A77326_BOOL_i` |
| `switch.dhw_heater_plan` | DHW plan | PAGE143.XML, `__T9B2DD143_BOOL_i` |
| `switch.electric_boiler_manual_mode` | Electric boiler manual mode | PAGE157.XML, `__T4C9EEAD0_BOOL_i` |

### Binary senzory

| entity_id | Nazev | Stranka a promenna |
|---|---|---|
| `binary_sensor.hw_heater_status` | HW heater | PAGE196.XML, `__T4404AB14_BOOL_i` |
| `binary_sensor.dhw_heater_status` | DHW heater status | PAGE143.XML, `__T8D88EB9A_BOOL_i` |
| `binary_sensor.pump_mode_heat` | Pump mode HEAT | PAGE196.XML, `__T39EF2789_BOOL_i` |
| `binary_sensor.pump_mode_cool` | Pump mode COOL | PAGE196.XML, `__T192CCB67_BOOL_i` |
| `binary_sensor.pump_mode_defrost` | Pump mode DEFROST | PAGE196.XML, `__TF62A071D_BOOL_i` |
| `binary_sensor.electric_boiler_status` | Electric boiler | PAGE157.XML, `__T24D5A69E_BOOL_i` |

### Number

| entity_id | Nazev | Stranka a promenna |
|---|---|---|
| `number.dhw_temperature_setting` | DHW temperature (20-55 °C, limit jednotky) | PAGE144.XML, `__TDF2423B2_REAL_.1f` |

### Text

| entity_id | Nazev | Stranka a promenna |
|---|---|---|
| `text.dhw_heating_from` | DHW heating from | PAGE144.XML, `__T324BA0AB_TIME_Thh:mm` |
| `text.dhw_heating_to` | DHW heating to | PAGE144.XML, `__TB07A911F_TIME_Thh:mm` |

## Pridani vlastnich entit

V detailu integrace otevri `Configure` a pole `Additional entities YAML`.
YAML se pri ulozeni kontroluje a pripadna chyba se zobrazi i s nazvem entity.

Format je YAML seznam objektu:

```yaml
- object_id: pool_temperature
  page: PAGE210.XML
  value_key: __T12345678_REAL_.1f
  kind: sensor
  name: Pool temperature
  device_class: temperature
  icon: mdi:pool
  unit: C
  precision: 1

- object_id: pool_target_temperature
  page: PAGE210.XML
  value_key: __T87654321_REAL_.1f
  kind: number
  name: Pool target temperature
  device_class: temperature
  icon: mdi:thermometer
  unit: C
  mode: slider
  min_value: 20
  max_value: 35
  step: 0.5
```

Nazev stranky a promenne zjistis tak, ze se v prohlizeci prihlasis k jednotce, najdes
stranku s pozadovanou hodnotou a otevres jeji XML (`http://<IP>/PAGExxx.XML`). Promenne
jsou v prvcich `<INPUT NAME="..." VALUE="..." />`.

### Podporovane `kind`

- `sensor`
- `binary_sensor`
- `switch`
- `number`
- `text`

Entita dostane `entity_id` `<kind>.<object_id>` (malymi pismeny). `object_id` muze obsahovat
jen pismena, cislice a podtrzitka. Entita se stejnym `object_id` jako vychozi entita ji nahradi.

### Poznamky k entitam

- `sensor` s `unit` nebo `device_class` ma automaticky `state_class: measurement`;
  jinou hodnotu (`total`, `total_increasing`) lze nastavit polem `state_class`.
- `switch` a `binary_sensor` mohou pouzit `payload_on` a `payload_off` (vychozi `1` a `0`).
- `number` muze pouzit `min_value`, `max_value`, `step`, `mode` (`auto`, `box`, `slider`).
  Limity nastav podle limitu jednotky, jinak jednotka zapis odmitne.
- `text` muze pouzit `pattern`.

## Vyvoj a testy

```bash
python3 -m venv .venv
.venv/bin/pip install -r requirements_test.txt
.venv/bin/python -m pytest
```

Testy bezi proti falesne jednotce, ktera vraci XML stranky ulozene v `tests/fixtures`.

## Troubleshooting

- Pokud jednotka vraci chybu typu `maximum number of connection is reached`, pockej 1-2 minuty.
  Integrace se pak pripoji sama, pri startu HA to zkousi opakovane.
- Pri spatnych prihlasovacich udajich HA zobrazi vyzvu k zadani noveho hesla.
- Neuspesny zapis (napr. vyprsela relace) se v HA zobrazi jako chyba akce.

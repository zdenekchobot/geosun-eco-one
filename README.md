# Geosun Eco One - Home Assistant custom integration

Tato custom integrace komunikuje s jednotkou GEOSUN Eco One primo pres HTTP/XML (bez MQTT).
Vibe coding - Github Copilot

## Co umi

- Pripojit se na jednotku pomoci IP adresy, uzivatele a hesla.
- Pravidelne nacitat stavy z XML stranek jednotky.
- Vytvorit vychozi entity prevzate z puvodni AppDaemon aplikace.
- Umoznit ovladani zapisovatelnych entit (`switch`, `number`, `text`).
- Umoznit jednoduche pridani vlastnich entit v `Options` jako JSON.

## Instalace

1. Zkopiruj slozku `custom_components/geosun_eco_one` do Home Assistant konfigurace.
2. Restartuj Home Assistant.
3. V UI otevri `Settings -> Devices & services -> Add Integration`.
4. Vyhledej `Geosun Eco One` a vypln:
   - IP/hostname jednotky
  - lze zadat `192.168.1.50`, `192.168.1.50:80` i `http://192.168.1.50`
   - uzivatel
   - heslo
   - interval aktualizace (minimalne 15 s)
   - metadata zarizeni

## Vychozi entity

Aktualni obsahuje 24 entit.

### Senzory

- `dhw_temperature` - DHW temperature (PAGE196.XML, __TF9DCC3BC_REAL_.1f)
- `dhw_temperature_hysteresis` - DHW temperature hysteresis (PAGE144.XML, __T0E14023C_REAL_.1f)
- `hw_temperature` - HW temperature (PAGE133.XML, __TF420903F_REAL_.1f)
- `hw_target_temperature` - HW target temperature (PAGE133.XML, __TB12A6D9A_REAL_.1f)
- `heat_pump_power` - Heat pump power (PAGE196.XML, __TA2C9CFCD_REAL_.2f)
- `heat_pump_consumption` - Heat pump consumption (PAGE196.XML, __T7816B7E5_REAL_.2f)
- `heat_pump_COP` - Heat pump COP (PAGE196.XML, __T1E26BB4F_REAL_.2f)
- `heat_pump_relative_power` - Heat pump relative power (PAGE196.XML, __TF7A12A3D_REAL_.0f)
- `water_heater_in` - Water heater in (PAGE196.XML, __T7FEC1C3B_REAL_.1f)
- `water_heater_out` - Water heater out (PAGE196.XML, __T20F39926_REAL_.1f)
- `outside_temperature_now` - Outside temperature (PAGE183.XML, __TFF513049_REAL_.1f)

### Switche

- `hw_heater_setting` - HW heater setting (PAGE132.XML, __TDE1D9B85_BOOL_i)
- `dhw_heater_setting` - DHW heater (PAGE143.XML, __TE5A77326_BOOL_i)
- `dhw_heater_plan` - DHW plan (PAGE143.XML, __T9B2DD143_BOOL_i)
- `electric_boiler_manual_mode` - Electric boiler manual mode (PAGE157.XML, __T4C9EEAD0_BOOL_i)

### Binary senzory

- `hw_heater_status` - HW heater (PAGE196.XML, __T4404AB14_BOOL_i)
- `dhw_heater_status` - DHW heater status (PAGE143.XML, __T8D88EB9A_BOOL_i)
- `pump_mode_heat` - Pump mode HEAT (PAGE196.XML, __T39EF2789_BOOL_i)
- `pump_mode_cool` - Pump mode COOL (PAGE196.XML, __T192CCB67_BOOL_i)
- `pump_mode_defrost` - Pump mode DEFROST (PAGE196.XML, __TF62A071D_BOOL_i)
- `electric_boiler_status` - Electric boiler (PAGE157.XML, __T24D5A69E_BOOL_i)

### Number

- `DHW_temperature_setting` - DHW temperature (PAGE144.XML, __TDF2423B2_REAL_.1f)

### Text

- `DHW_heating_from` - DHW heating from (PAGE144.XML, __T324BA0AB_TIME_Thh:mm)
- `DHW_heating_to` - DHW heating to (PAGE144.XML, __TB07A911F_TIME_Thh:mm)

## Pridani vlastnich entit

V detailu integrace otevri `Configure` a pole `Additional entities JSON`.

Format je pole objektu:

```json
[
  {
    "object_id": "pool_temperature",
    "page": "PAGE210.XML",
    "value_key": "__T12345678_REAL_.1f",
    "kind": "sensor",
    "name": "Pool temperature",
    "device_class": "temperature",
    "icon": "mdi:pool",
    "unit": "C",
    "precision": 1
  },
  {
    "object_id": "pool_target_temperature",
    "page": "PAGE210.XML",
    "value_key": "__T87654321_REAL_.1f",
    "kind": "number",
    "name": "Pool target temperature",
    "device_class": "temperature",
    "icon": "mdi:thermometer",
    "unit": "C",
    "precision": 1,
    "mode": "slider",
    "min_value": 20,
    "max_value": 35,
    "step": 0.5
  }
]
```

### Podporovane `kind`

- `sensor`
- `binary_sensor`
- `switch`
- `number`
- `text`

### Poznamky k zapisovatelnym entitam

- `switch` a `binary_sensor` mohou pouzit `payload_on` a `payload_off`.
- `number` muze pouzit `min_value`, `max_value`, `step`, `mode`.
- `text` muze pouzit `pattern`.

### Poznamka k ID entit

- Integrace navrhuje `entity_id` z `object_id` (napr. `sensor.dhw_temperature`).
- Pokud uz existuje starsi zaznam v registru entit, Home Assistant muze ponechat puvodni `entity_id`.
- V takovem pripade proved rename v `Settings -> Devices & services -> Entities` nebo entity odstran a nech je vytvorit znovu.

## Troubleshooting

- Pokud jednotka vraci chybu typu `maximum number of connection is reached`, pockej 1-2 minuty a zkousej nastaveni znovu.
- Pri spatnych prihlasovacich udajich integrace nyni vraci chybu autentizace misto obecne chyby pripojeni.
- Pokud se integrace vytvori, ale bez entit a s chybou `Failed to fetch page ...`, obvykle jde o neplatnou session na strane jednotky. Restart integrace po kratke prodleve problem vetsinou vyresi.

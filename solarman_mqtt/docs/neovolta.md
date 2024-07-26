# NeoVolta

Use Solarman MQTT add-on with a [NeoVolta](https://neovolta.com) home battery.

## Configuration

1. Set up [Solarman MQTT add-on](../DOCS.md)

2. Update Home Assistant configuration.yaml file

In the Home Assistant configuration.yaml file, add

```yaml
mqtt: !include mqtt.yaml
template: !include template.yaml
```

3. Add the MQTT sensors in the mqtt.yaml file

Add the following into mqtt.yaml

```yaml
sensor:
  - name: "NeoVolta Battery"
    state_topic: "solarmanpv/station/batterySoc"
    unique_id: "neovolta_batterySoc"
    unit_of_measurement: "%"
    device_class: battery
    state_class: measurement

  - name: "NeoVolta Battery"
    state_topic: "solarmanpv/station/batteryPower"
    unique_id: "neovolta_batteryPower"
    unit_of_measurement: "W"
    device_class: power
    state_class: measurement

  - name: "NeoVolta Consumption"
    state_topic: "solarmanpv/station/usePower"
    unique_id: "neovolta_usePower"
    unit_of_measurement: "W"
    device_class: power
    state_class: measurement

  - name: "NeoVolta Grid"
    state_topic: "solarmanpv/station/purchasePower"
    unique_id: "neovolta_purchasePower"
    unit_of_measurement: "W"
    device_class: power
    state_class: measurement

  - name: "NeoVolta Wire Power ???"
    state_topic: "solarmanpv/station/wirePower"
    unique_id: "neovolta_wirePower"
    unit_of_measurement: "W"
    device_class: power
    state_class: measurement

  - name: "NeoVolta Discharge Power"
    state_topic: "solarmanpv/station/dischargePower"
    unique_id: "neovolta_dischargePower"
    unit_of_measurement: "W"
    device_class: power
    state_class: measurement

  - name: "NeoVolta Cumulative Prodcution"
    state_topic: "solarmanpv/station/generationTotal"
    unique_id: "neovolta_generationTotal"
    unit_of_measurement: "kWh"
    device_class: energy
    state_class: total

  - name: "NeoVolta Grid Power"
    state_topic: "solarmanpv/station/gridPower"
    unique_id: "neovolta_gridPower"
    unit_of_measurement: "W"
    device_class: power
    state_class: measurement

  - name: "NeoVolta Charge Power"
    state_topic: "solarmanpv/station/chargePower"
    unique_id: "neovolta_chargePower"
    unit_of_measurement: "W"
    device_class: power
    state_class: measurement

  # get attributes from the Inverter and Logger
  - name: "solarmanpv_inverter"
    unique_id: "solarmanpv_inverter"
    state_topic: "solarmanpv/inverter/deviceState"
    json_attributes_topic: "solarmanpv/inverter/attributes"

  - name: "solarmanpv_logger"
    unique_id: "solarmanpv_logger"
    state_topic: "solarmanpv/logger/deviceState"
    json_attributes_topic: "solarmanpv/logger/attributes"
```

4. Add template sensors to get data from MQTT values

Add the following into template.yaml

```yaml
# Neovolta - Inverter - Electricity Generation
- sensor:
    - name: "NeoVolta DC Voltage PV1"
      unique_id: "neovolta_dc_voltage_pv1"
      unit_of_measurement: "V"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'DC_Voltage_PV1') }}"
      device_class: voltage
- sensor:
    - name: "NeoVolta DC Current PV1"
      unique_id: "neovolta_dc_current_pv1"
      unit_of_measurement: "A"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'DC_Current_PV1') }}"
      device_class: current
- sensor:
    - name: "NeoVolta DC Power PV1"
      unique_id: "neovolta_dc_power_pv1"
      unit_of_measurement: "W"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'DC_Power_PV1') }}"
      device_class: power
- sensor:
    - name: "NeoVolta DC Voltage PV2"
      unique_id: "neovolta_dc_voltage_pv2"
      unit_of_measurement: "V"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'DC_Voltage_PV2') }}"
      device_class: voltage
- sensor:
    - name: "NeoVolta DC Current PV2"
      unique_id: "neovolta_dc_current_pv2"
      unit_of_measurement: "A"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'DC_Current_PV2') }}"
      device_class: current
- sensor:
    - name: "NeoVolta DC Power PV2"
      unique_id: "neovolta_dc_power_pv2"
      unit_of_measurement: "W"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'DC_Power_PV2') }}"
      device_class: power
- sensor:
    - name: "NeoVolta DC Voltage PV3"
      unique_id: "neovolta_dc_voltage_pv3"
      unit_of_measurement: "V"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'DC_Voltage_PV3') }}"
      device_class: voltage
- sensor:
    - name: "NeoVolta DC Current PV3"
      unique_id: "neovolta_dc_current_pv3"
      unit_of_measurement: "A"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'DC_Current_PV3') }}"
      device_class: current
- sensor:
    - name: "NeoVolta DC Power PV3"
      unique_id: "neovolta_dc_power_pv3"
      unit_of_measurement: "W"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'DC_Power_PV3') }}"
      device_class: power
- sensor:
    - name: "NeoVolta DC Voltage PV4"
      unique_id: "neovolta_dc_voltage_pv4"
      unit_of_measurement: "V"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'DC_Voltage_PV4') }}"
      device_class: voltage
- sensor:
    - name: "NeoVolta DC Current PV4"
      unique_id: "neovolta_dc_current_pv4"
      unit_of_measurement: "A"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'DC_Current_PV4') }}"
      device_class: current
- sensor:
    - name: "NeoVolta DC Power PV4"
      unique_id: "neovolta_dc_power_pv4"
      unit_of_measurement: "W"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'DC_Power_PV4') }}"
      device_class: power
- sensor:
    - name: "NeoVolta AC Voltage R"
      unique_id: "neovolta_ac_voltage_r"
      unit_of_measurement: "V"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'AC_Voltage_R/U/A') }}"
      device_class: voltage
- sensor:
    - name: "NeoVolta AC Current R"
      unique_id: "neovolta_ac_current_r"
      unit_of_measurement: "A"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'AC_Current_R/U/A') }}"
      device_class: current
- sensor:
    - name: "NeoVolta AC Frequency R"
      unique_id: "neovolta_ac_frequency_r"
      unit_of_measurement: "Hz"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'AC_Output_Frequency_R') }}"
      device_class: frequency
- sensor:
    - name: "NeoVolta AC Voltage S"
      unique_id: "neovolta_ac_voltage_s"
      unit_of_measurement: "V"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'AC_Voltage_S/V/B') }}"
      device_class: voltage
- sensor:
    - name: "NeoVolta AC Current S"
      unique_id: "neovolta_ac_current_s"
      unit_of_measurement: "A"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'AC_Current_S/V/B') }}"
      device_class: current
- sensor:
    - name: "NeoVolta Total DC Input Power"
      unique_id: "neovolta_total_dc_input_power"
      unit_of_measurement: "W"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Total_DC_Input_Power') }}"
      device_class: power
- sensor:
    - name: "NeoVolta Cumulative Production (Active)"
      unique_id: "neovolta_cumulative_production_active"
      unit_of_measurement: "kWh"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Cumulative_Production_(Active)') }}"
      device_class: energy
      state_class: total
- sensor:
    - name: "NeoVolta Daily Production (Active)"
      unique_id: "neovolta_daily_production_active"
      unit_of_measurement: "kWh"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Daily_Production_(Active)') }}"
      device_class: energy
      state_class: total
- sensor:
    - name: "NeoVolta Inverter Output Power L1"
      unique_id: "neovolta_inverter_output_power_l1"
      unit_of_measurement: "W"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Inverter_Output_Power_L1') }}"
      device_class: power
- sensor:
    - name: "NeoVolta Inverter Output Power L2"
      unique_id: "neovolta_inverter_output_power_l2"
      unit_of_measurement: "W"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Inverter_Output_Power_L2') }}"
      device_class: power

# Neovolta - Inverter - Basic Information
- sensor:
    - name: "NeoVolta Inverter Serial Number"
      unique_id: "neovolta_inverter_serial_number"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'SN') }}"
- sensor:
    - name: "NeoVolta Inverter Type"
      unique_id: "neovolta_inverter_type"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Inverter_Type') }}"
- sensor:
    - name: "NeoVolta General Settings"
      unique_id: "neovolta_inverter_general_settings"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'General_settings') }}"
- sensor:
    - name: "NeoVolta Battery Voltage Type"
      unique_id: "neovolta_battery_voltage_type"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Battery_Voltage_Type') }}"
- sensor:
    - name: "NeoVolta IMEI"
      unique_id: "neovolta_IMEI"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'IMEI') }}"
- sensor:
    - name: "NeoVolta Rated Power"
      unique_id: "neovolta_rated_power"
      unit_of_measurement: "W"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Rated_Power') }}"
      device_class: power

# Neovolta - Inverter - Version Information
- sensor:
    - name: "NeoVolta Protocol Version"
      unique_id: "neovolta_protocol_version"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Protocol_Version') }}"
- sensor:
    - name: "NeoVolta HMI"
      unique_id: "neovolta_HMI"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'HMI') }}"
- sensor:
    - name: "NeoVolta Lithium Bettery Version"
      unique_id: "neovolta_lithium_battery_version"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Lithium_Battery_Version_Number') }}"
- sensor:
    - name: "NeoVolta Main1"
      unique_id: "neovolta_main1"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'MAIN_1') }}"
- sensor:
    - name: "NeoVolta Main2"
      unique_id: "neovolta_main2"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'MAIN_2') }}"

# Neovolta - Inverter - Power Grid
- sensor:
    - name: "NeoVolta Grid Voltage L1"
      unique_id: "neovolta_grid_voltage_l1"
      unit_of_measurement: "V"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Grid\u00a0Voltage\u00a0L1') }}"
      device_class: voltage
- sensor:
    - name: "NeoVolta Grid Power L1"
      unique_id: "neovolta_grid_power_l1"
      unit_of_measurement: "W"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Grid_Power_L1') }}"
      device_class: power
- sensor:
    - name: "NeoVolta Grid Voltage L2"
      unique_id: "neovolta_grid_voltage_l2"
      unit_of_measurement: "V"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Grid\u00a0Voltage\u00a0L2') }}"
      device_class: voltage
- sensor:
    - name: "NeoVolta Grid Power L2"
      unique_id: "neovolta_grid_power_l2"
      unit_of_measurement: "W"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Grid_Power_L2') }}"
      device_class: power
- sensor:
    - name: "NeoVolta Grid Type"
      unique_id: "neovolta_grid_type"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Grid_Type') }}"
- sensor:
    - name: "NeoVolta External CT1 Power"
      unique_id: "neovolta_external_ct1_power"
      unit_of_measurement: "W"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'External_CT1_Power') }}"
      device_class: power
- sensor:
    - name: "NeoVolta External CT2 Power"
      unique_id: "neovolta_external_ct2_power"
      unit_of_measurement: "W"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'External_CT2_Power') }}"
      device_class: power
- sensor:
    - name: "NeoVolta Grid Frequency"
      unique_id: "neovolta_grid_frequency"
      unit_of_measurement: "Hz"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Grid_Frequency') }}"
      device_class: frequency
- sensor:
    - name: "NeoVolta Total Grid Power"
      unique_id: "neovolta_total_grid_power"
      unit_of_measurement: "W"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Total_Grid_Power') }}"
      device_class: power
- sensor:
    - name: "NeoVolta Cumulative Grid Feed-in"
      unique_id: "neovolta_cumulative_grid_feed_in"
      unit_of_measurement: "kWh"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Cumulative_Grid_Feed-in') }}"
      device_class: energy
      state_class: total
- sensor:
    - name: "NeoVolta Cumulative Energy Purchased"
      unique_id: "neovolta_cumulative_energy_purchased"
      unit_of_measurement: "kWh"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Cumulative_Energy_Purchased') }}"
      device_class: energy
      state_class: total
- sensor:
    - name: "NeoVolta Daily Grid Feed-in"
      unique_id: "neovolta_daily_grid_feed_in"
      unit_of_measurement: "kWh"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Daily_Grid_Feed-in') }}"
      device_class: energy
      state_class: total
- sensor:
    - name: "NeoVolta Daily Energy Purchased"
      unique_id: "neovolta_daily_energy_purchased"
      unit_of_measurement: "kWh"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Daily_Energy_Purchased') }}"
      device_class: energy
      state_class: total
- sensor:
    - name: "NeoVolta Total CT Power"
      unique_id: "neovolta_total_ct_power"
      unit_of_measurement: "W"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Total_CT_Power') }}"
      device_class: power
# Neovolta - Inverter - Electricity Consumption
- sensor:
    - name: "NeoVolta Load Voltage L1"
      unique_id: "neovolta_load_voltage_l1"
      unit_of_measurement: "V"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Load_Voltage__L1') }}"
      device_class: voltage
- sensor:
    - name: "NeoVolta Load Voltage L2"
      unique_id: "neovolta_load_voltage_l2"
      unit_of_measurement: "V"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Load_Voltage__L2') }}"
      device_class: voltage
- sensor:
    - name: "NeoVolta Load Power L1"
      unique_id: "neovolta_load_power_l1"
      unit_of_measurement: "W"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Load__Power_L1') }}"
      device_class: power
- sensor:
    - name: "NeoVolta Load Power L2"
      unique_id: "neovolta_load_power_l2"
      unit_of_measurement: "W"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Load__Power_L2') }}"
      device_class: power
- sensor:
    - name: "NeoVolta Total Consumption Power"
      unique_id: "neovolta_total_consumption_power"
      unit_of_measurement: "W"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Total_Consumption_Power') }}"
      device_class: power
- sensor:
    - name: "NeoVolta Cumulative Consumption"
      unique_id: "neovolta_cumulative_consumption"
      unit_of_measurement: "kWh"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Cumulative_Consumption') }}"
      device_class: energy
      state_class: total
- sensor:
    - name: "NeoVolta Daily Consumption"
      unique_id: "neovolta_daily_consumption"
      unit_of_measurement: "kWh"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Daily_Consumption') }}"
      device_class: energy
      state_class: total
# Neovolta - Inverter - Battery
- sensor:
    - name: "NeoVolta Daily Charging Energy"
      unique_id: "neovolta_daily_charging_energy"
      unit_of_measurement: "kWh"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Daily_Charging_Energy') }}"
      device_class: energy
      state_class: total
- sensor:
    - name: "NeoVolta Daily Discharging Energy"
      unique_id: "neovolta_daily_discharging_energy"
      unit_of_measurement: "kWh"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Daily_Discharging_Energy') }}"
      device_class: energy
      state_class: total
- sensor:
    - name: "NeoVolta Total Charging Energy"
      unique_id: "neovolta_total_charging_energy"
      unit_of_measurement: "kWh"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Total_Charging_Energy') }}"
      device_class: energy
      state_class: total
- sensor:
    - name: "NeoVolta Total Discharging Energy"
      unique_id: "neovolta_total_discharging_energy"
      unit_of_measurement: "kWh"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Total_Discharging_Energy') }}"
      device_class: energy
      state_class: total
- sensor:
    - name: "NeoVolta Battery Voltage"
      unique_id: "neovolta_battery_voltage"
      unit_of_measurement: "V"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Battery_Voltage') }}"
      device_class: voltage
- sensor:
    - name: "NeoVolta Battery Current"
      unique_id: "neovolta_battery_current"
      unit_of_measurement: "A"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Battery_Current') }}"
      device_class: current
- sensor:
    - name: "NeoVolta Battery Power"
      unique_id: "neovolta_battery_power"
      unit_of_measurement: "W"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Battery_Power') }}"
      device_class: power
- sensor:
    - name: "NeoVolta Battery Status"
      unique_id: "neovolta_battery_status"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Battery_Status') }}"
- sensor:
    - name: "NeoVolta Battery Type"
      unique_id: "neovolta_battery_type"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Battery_Type') }}"
- sensor:
    - name: "NeoVolta Battery SoC"
      unique_id: "neovolta_battery_soc"
      unit_of_measurement: "%"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'SoC') }}"
      device_class: battery

# Neovolta - Inverter - Battery Pack 2
# Neovolta - Inverter - Battery Pack 3
# Neovolta - Inverter - Battery Pack 5

# Neovolta - Inverter - BMS
- sensor:
    - name: "NeoVolta BMS Voltage"
      unique_id: "neovolta_bms_voltage"
      unit_of_measurement: "V"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'BMS_Voltage') }}"
      device_class: voltage
- sensor:
    - name: "NeoVolta BMS Current"
      unique_id: "neovolta_bms_current"
      unit_of_measurement: "A"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'BMS_Current') }}"
      device_class: current
- sensor:
    - name: "NeoVolta BMS Temperature"
      unique_id: "neovolta_bms_temperature"
      unit_of_measurement: "°C"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'BMS_Temperature') }}"
      device_class: temperature
- sensor:
    - name: "NeoVolta Charge Current Limit"
      unique_id: "neovolta_charge_current_limit"
      unit_of_measurement: "A"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Charge_current_limit') }}"
      device_class: current
- sensor:
    - name: "NeoVolta Discharge Current Limit"
      unique_id: "neovolta_discharge_current_limit"
      unit_of_measurement: "A"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Discharge_Current_Limit') }}"
      device_class: current
- sensor:
    - name: "NeoVolta BMS SoC"
      unique_id: "neovolta_bms_soc"
      unit_of_measurement: "%"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'BMS_SOC') }}"
      device_class: battery
- sensor:
    - name: "NeoVolta BMS Charge Voltage"
      unique_id: "neovolta_bms_charge_voltage"
      unit_of_measurement: "V"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'BMS_Charge_Voltage') }}"
      device_class: voltage
- sensor:
    - name: "NeoVolta BMS Discharge Voltage"
      unique_id: "neovolta_bms_discharge_voltage"
      unit_of_measurement: "V"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'BMS_Discharge_Voltage') }}"
      device_class: voltage

# Neovolta - Inverter - Temperature
- sensor:
    - name: "NeoVolta Battery Temperature"
      unique_id: "neovolta_battery_temperature"
      unit_of_measurement: "°C"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Temperature-_Battery') }}"
      device_class: temperature
- sensor:
    - name: "NeoVolta DC Temperature"
      unique_id: "neovolta_dc_temperature"
      unit_of_measurement: "°C"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'DC_Temperature') }}"
      device_class: temperature
- sensor:
    - name: "NeoVolta AC Temperature"
      unique_id: "neovolta_ac_temperature"
      unit_of_measurement: "°C"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'AC_Temperature') }}"
      device_class: temperature

# Neovolta - Inverter - State
- sensor:
    - name: "NeoVolta Grid Relay Status"
      unique_id: "neovolta_grid_relay_status"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Grid_Relay_Status') }}"

# Neovolta - Inverter - Microinverter
- sensor:
    - name: "NeoVolta Microinverter Voltage"
      unique_id: "neovolta_microinverter_voltage"
      unit_of_measurement: "V"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'MI_Voltage') }}"
      device_class: voltage
- sensor:
    - name: "NeoVolta Daily Production MI"
      unique_id: "neovolta_daily_production_microinverter"
      unit_of_measurement: "kWh"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Daily_Production_MI') }}"
      device_class: energy
      state_class: total
- sensor:
    - name: "NeoVolta Total Production MI"
      unique_id: "neovolta_total_production_microinverter"
      unit_of_measurement: "kWh"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'Total_Production_MI') }}"
      device_class: energy
      state_class: total
- sensor:
    - name: "NeoVolta MI Power"
      unique_id: "neovolta_microinverter_power"
      unit_of_measurement: "W"
      state: "{{ state_attr('sensor.solarmanpv_inverter', 'MI__Power') }}"
      device_class: power
```

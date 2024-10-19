#!/usr/bin/with-contenv bashio
set -e

bashio::log.info "Starting Solarman-MQTT add-on"

python_version=$(python3 -V)
bashio::log.debug "Using $python_version"

bashio::log.debug "Pull Solarman config from HA add-on config"
SM_USERNAME=$(bashio::config 'solarman_username')
SM_PASSWORD=$(bashio::config 'solarman_password')
SM_APP_ID=$(bashio::config 'solarman_app_id')
SM_SECRET=$(bashio::config 'solarman_secret')
SM_NAME=$(bashio::config 'solarman_name')
SM_STATION=$(bashio::config 'solarman_station')
SM_INVERTER=$(bashio::config 'solarman_inverter')
SM_LOGGER=$(bashio::config 'solarman_logger')

bashio::log.debug "Generate Solarman passhash from password"
SM_HASH=$(exec python3 /app/solarman-mqtt/run.py --create-passhash "$SM_PASSWORD")
bashio::log.debug "Hash is $SM_HASH"

bashio::log.info "Pull MQTT config from HA add-on config"
MQTT_BROKER=$(bashio::config 'mqtt_broker')
MQTT_PORT=$(bashio::config 'mqtt_port')
MQTT_TOPIC=$(bashio::config 'mqtt_topic')
MQTT_USERNAME=$(bashio::config 'mqtt_username')
MQTT_PASSWORD=$(bashio::config 'mqtt_password')

bashio::log.info "Creating Solarman-MQTT configuration file"
cat << EOF > config.json
{
  "name": "$SM_NAME",
  "url": "globalapi.solarmanpv.com",
  "appid": "$SM_APP_ID",
  "secret": "$SM_SECRET",
  "username": "$SM_USERNAME",
  "passhash": "$SM_HASH",
  "stationId": $SM_STATION,
  "inverterId": $SM_INVERTER,
  "loggerId": $SM_LOGGER,
  "debug": false,
  "mqtt":{
    "broker": "$MQTT_BROKER",
    "port": $MQTT_PORT,
    "topic": "$MQTT_TOPIC",
    "username": "$MQTT_USERNAME",
    "password": "$MQTT_PASSWORD",
    "qos": 1,
    "retain": true
  }
}
EOF

if [ ! -f "config.json" ]; then
    bashio::log.error "Solarman-MQTT config file was not saved properly"
else
    bashio::log.info "Solarman-MQTT configuration complete. Starting daemon."
    python3 /app/solarman-mqtt/run.py -d
fi

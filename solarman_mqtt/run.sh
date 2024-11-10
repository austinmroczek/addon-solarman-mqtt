#!/usr/bin/with-contenv bashio
set -e

bashio::log.info "Starting Solarman-MQTT add-on"

python_version=$(python3 -V)
bashio::log.info "Using $python_version"

# a config file must exist before running the script to create the hast
if [ ! -f "config.json" ]; then
    bashio::log.info "Solarman-MQTT config file does not exist. Generating from sample."
    cp /app/solarman-mqtt/config.sample.json config.json
fi

bashio::log.info "Pull Solarman config from HA add-on config"
SM_USERNAME=$(bashio::config 'solarman_username' | jq -Rsa .)
SM_PASSWORD=$(bashio::config 'solarman_password')
SM_APP_ID=$(bashio::config 'solarman_app_id' | jq -Rsa .)
SM_SECRET=$(bashio::config 'solarman_secret' | jq -Rsa .)
SM_NAME=$(bashio::config 'solarman_name' | jq -Rsa .)
SM_STATION=$(bashio::config 'solarman_station' | jq -Rsa .)
SM_INVERTER=$(bashio::config 'solarman_inverter' | jq -Rsa .)
SM_LOGGER=$(bashio::config 'solarman_logger' | jq -Rsa .)

bashio::log.info "Generate Solarman passhash from password"
SM_HASH=$(exec python3 /app/solarman-mqtt/run.py --create-passhash "$SM_PASSWORD")
bashio::log.info "Hash is $SM_HASH"

bashio::log.info "Pull MQTT config from MQTT add-on"
MQTT_BROKER=$(bashio::services mqtt "host" | jq -Rsa .)
MQTT_PORT=$(bashio::services mqtt "port" | jq -Rsa .)
MQTT_USERNAME=$(bashio::services mqtt "username" | jq -Rsa .)
MQTT_PASSWORD=$(bashio::services mqtt "password" | jq -Rsa .)

bashio::log.info "Pull MQTT topic from add-on config"
MQTT_TOPIC=$(bashio::config 'mqtt_topic'  | jq -Rsa .)


bashio::log.info "Creating Solarman-MQTT configuration file"
cat << EOF > config.json
{
  "name": $SM_NAME,
  "url": "globalapi.solarmanpv.com",
  "appid": $SM_APP_ID,
  "secret": $SM_SECRET,
  "username": $SM_USERNAME,
  "passhash": "$SM_HASH",
  "stationId": $SM_STATION,
  "inverterId": $SM_INVERTER,
  "loggerId": $SM_LOGGER,
  "debug": false,
  "mqtt":{
    "broker": $MQTT_BROKER,
    "port": $MQTT_PORT,
    "topic": $MQTT_TOPIC,
    "username": $MQTT_USERNAME,
    "password": $MQTT_PASSWORD,
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

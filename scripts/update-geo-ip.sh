#!/bin/sh
# Script to update the Geo IP databases by Maxmind.
# See README for more info.

HOSTNAME=$(hostname)

geoipupdate -f ${GEOIP_CONF_LOCATION} -d "/usr/src/geoip";

# Send Telegram message
curl -s "https://api.telegram.org/bot${TELEGRAM_MICHELED_ALIVE_MESSAGES_API_KEY}/sendMessage?chat_id=${TELEGRAM_MICHELED_ALIVE_MESSAGES_CHAT_ID}&parse_mode=HTML&text=<code>${HOSTNAME}::ALIVE_MESSAGE::UPDATE_GEO_IP \"Ok\"</code>";

exit 0

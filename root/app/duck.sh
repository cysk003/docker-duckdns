#!/usr/bin/with-contenv bash

. /app/duck.conf
# SUBDOMAINS=SUBDOMAINS
# TOKEN=TOKEN
URL_DETECT_IPV4=https://api.ipify.org
URL_DETECT_IPV6=https://api6.ipify.org
IPV4ADDR=$(curl -s ${URL_DETECT_IPV4})
IPV6ADDR=$(curl -s ${URL_DETECT_IPV6})
RESPONSE=$(curl -sSk "https://www.duckdns.org/update?domains=${SUBDOMAINS}&token=${TOKEN}&ip=${IPV4ADDR}")
if [ "${RESPONSE}" = "OK" ]; then
    echo "Your IP ${IPV4ADDR} was updated at $(date)"
else
    echo -e "Something went wrong, please check your settings $(date)\nThe response returned was:\n${RESPONSE}"
fi

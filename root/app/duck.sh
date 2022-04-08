#!/usr/bin/with-contenv bash

. /app/duck.conf
IPV4ADDR=$(curl -s https://api.ipify.org)
RESPONSE=$(curl -sSk "https://www.duckdns.org/update?domains=${SUBDOMAINS}&token=${TOKEN}&ip=${IPV4ADDR}")
if [ "${RESPONSE}" = "OK" ]; then
    echo "Your IP ${IPV4ADDR} was updated at $(date)"
else
    echo -e "Something went wrong, please check your settings $(date)\nThe response returned was:\n${RESPONSE}"
fi

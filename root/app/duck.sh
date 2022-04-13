#!/usr/bin/with-contenv bash

. /app/duck.conf
# USERNAME=USERNAME
# PASSWORD=PASSWORD
# HOSTNAME=HOSTNAME
URL_DETECT_IPV4=https://api.ipify.org
URL_DETECT_IPV6=https://api6.ipify.org
IPV4ADDR=$(curl -s ${URL_DETECT_IPV4})
IPV6ADDR=$(curl -s ${URL_DETECT_IPV6})
AUTH=$(echo "$USERNAME:$PASSWORD" | base64)
AGENT="$(uname -srom) $USERNAME [Script at https://github.com/axelrindle/noip-update-script]"
RESPONSE=$(curl --silent --header "Authorization: Basic $AUTH" --header "User-Agent: $AGENT" "https://dynupdate.no-ip.com/nic/update?hostname=$HOSTNAME&myip=$IPV4ADDR&myipv6=$IPV6ADDR")
echo -e "$(date) ${RESPONSE}"
#!/usr/bin/with-contenv bash

. /app/duck.conf
# USERNAME=USERNAME
# PASSWORD=PASSWORD
# HOSTNAME=HOSTNAME
# LOCATION=LOCATION
# ALIAS=ALIAS
URL_DETECT_IPV4=https://api.ipify.org
URL_DETECT_IPV6=https://api6.ipify.org
IPV4ADDR=$(curl -s ${URL_DETECT_IPV4})
IPV6ADDR=$(curl -s ${URL_DETECT_IPV6})
PASSWORDMD5=$(echo "$PASSWORD" | base64)
RESPONSE=$(curl --silent "https://api.dynu.com/nic/update?username=$USERNAME&password=$PASSWORDMD5&hostname=$HOSTNAME&location=$LOCATION&alias=$ALIAS&myip=$IPV4ADDR&myipv6=$IPV6ADDR")
echo -e "$(date) $HOSTNAME $IPV4ADDR ${RESPONSE} "
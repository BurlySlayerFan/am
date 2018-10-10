AM_PROTOCOL="http"
AM_URL="openam.example.com"
AM_PORT="8080"
AM_CONTEXT="openam"
AM_HOST=$AM_PROTOCOL"://"$AM_URL":"$AM_PORT"/""$AM_CONTEXT"
AMSTER_KEY="/home/ahaskins/openam/amster_rsa"
AM_IMPORT_PATH="/tmp/config"
AM_PASSWORD="password"

amster/amster -d am_install.amster -D AM_HOST=${AM_HOST} -D AMSTER_KEY=${AMSTER_KEY} -D AM_IMPORT_PATH=${AM_IMPORT_PATH} -D AM_PASSWORD=${AM_PASSWORD}

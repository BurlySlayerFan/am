AM_PROTOCOL="http"
AM_URL="openam.example.com"
AM_PORT="8080"
AM_CONTEXT="openam"
AM_HOST=$AM_PROTOCOL"://"$AM_URL":"$AM_PORT"/""$AM_CONTEXT"

amster/amster -d am_install.amster -D AM_HOST=${AM_HOST}

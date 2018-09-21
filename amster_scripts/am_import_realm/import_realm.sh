AM_PROTOCOL="http"
AM_URL="openam.example.com"
AM_PORT="8080"
AM_CONTEXT="openam"
AM_HOST=$AM_PROTOCOL"://"$AM_URL":"$AM_PORT"/""$AM_CONTEXT"
AMSTER_KEY="/home/ahaskins/openam_0/amster_rsa"
SITE_ID="myAMSite"
export ALIASES="[\"some_am\",\"some_other_am\"]"
./amster import_realm.amster -D AM_HOST=${AM_HOST} -D AMSTER_KEY=${AMSTER_KEY}

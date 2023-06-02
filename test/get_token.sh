#!/usr/bin/env bash

get_token() {
    CLIENT_SECRET=$1
    USERNAME=$2
    PASSWORD=$3

    curl -v --location --request POST "http://localhost:8282/realms/esbz/protocol/openid-connect/token" \
        --header "Content-Type: application/x-www-form-urlencoded" \
        --data-urlencode "client_id=binda-ui_access" \
        --data-urlencode "grant_type=password" \
        --data-urlencode "username=${USERNAME}" \
        --data-urlencode "password=${PASSWORD}" \
        --data-urlencode "scope=openid" \
        --data-urlencode "client_secret=${CLIENT_SECRET}"
}

export THISDIR=$(dirname $(readlink -f $0))
source ${THISDIR}/../cyber4dev-binda-api/test/create_data.sh

USERNAME="testuser001"
PASSWORD="testuser001"
#USERNAME="testseki01"
#PASSWORD="testseki01"
CLIENT_SECRET=">Hs8wkP14XzKAj63GpYlKSt529rAsSl83"

TOKEN=$(get_token "$CLIENT_SECRET" "$USERNAME" "$PASSWORD" | jq -r ".access_token")

echo "========================= TOKEN ========================="
echo "${TOKEN}" | jq -R 'split(".") | .[0],.[1] | @base64d | fromjson'
echo

echo "${TOKEN}"

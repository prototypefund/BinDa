#!/usr/bin/env bash

get_token() {
    CLIENT_SECRET=$1
    USERNAME=$2
    PASSWORD=$USERNAME

    curl -s --location \
        --request POST "http://localhost:8282/realms/esbz/protocol/openid-connect/token" \
        --header "Content-Type: application/x-www-form-urlencoded" \
        --data-urlencode "client_id=binda-ui_access" \
        --data-urlencode "grant_type=password" \
        --data-urlencode "username=${USERNAME}" \
        --data-urlencode "password=${PASSWORD}" \
        --data-urlencode "scope=openid" \
        --data-urlencode "client_secret=${CLIENT_SECRET}"
}

CLIENT_SECRET="zpLfQrWxWEknlpPEaxdF6scPDw3nEvOU"

for username in \
    "testuser001"\
    "testseki01"\
    "testteacher01"\
    "testteacher02"\
    "testteacher03"\
    "testteacher04"\
    "testteacher05";
do
    TOKEN=$(get_token "${CLIENT_SECRET}" "${username}" | jq -r ".access_token")

    echo "========================= TOKEN (${username}) ========================="
    echo "${TOKEN}" | jq -R 'split(".") | .[0],.[1] | @base64d | fromjson'
    echo "${TOKEN}"
    echo
done

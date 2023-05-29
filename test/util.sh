get_token() {
    CLIENT_SECRET=$1
    USERNAME=$2
    PASSWORD=$3

    curl --location --request POST "http://localhost:8282/realms/esbz/protocol/openid-connect/token" \
        --header "Content-Type: application/x-www-form-urlencoded" \
        --data-urlencode "client_id=binda-ui_access" \
        --data-urlencode "grant_type=password" \
        --data-urlencode "username=${USERNAME}" \
        --data-urlencode "password=${PASSWORD}" \
        --data-urlencode "scope=openid" \
        --data-urlencode "client_secret=${CLIENT_SECRET}" \
        | jq -r ".access_token"
}

create_member() {
    TOKEN=$1
    NAME=$2
    RESP_FOR_MEMBERS=$3

    data="{\"name\":${NAME},\"responsible_for\":${RESP_FOR_MEMBERS}}"
    if false; then
        echo "$data"
    else
        curl -X 'POST' \
            'http://localhost:8000/api/v1/member' \
            -H 'accept: application/json' \
            -H 'Content-Type: application/json' \
            -H "Authorization: Bearer ${TOKEN}" \
            -d "${data}"
    fi
}

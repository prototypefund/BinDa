TOKEN=$(curl -v --location --request POST 'http://localhost:8282/realms/esbz/protocol/openid-connect/token' \
    --header 'Content-Type: application/x-www-form-urlencoded' \
    --data-urlencode 'client_id=binda-ui_access' \
    --data-urlencode 'grant_type=password' \
    --data-urlencode 'username=testuser001' \
    --data-urlencode 'password=testuser001' \
    --data-urlencode 'scope=openid' \
    --data-urlencode 'client_secret=>Hs8wkP14XzKAj63GpYlKSt529rAsSl83' \
    | jq -r '.access_token')

echo "${TOKEN}" > token.txt

echo "${TOKEN}" | jq -R 'split(".") | .[0],.[1] | @base64d | fromjson'
echo "${TOKEN}" | jq -R 'split(".") | .[2]' | sed 's/\"//g' > signature.txt

curl -v -X 'POST' \
  'http://localhost:8000/api/v1/member' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer ${TOKEN}" \
  -d '{ "name": "Peter" }'

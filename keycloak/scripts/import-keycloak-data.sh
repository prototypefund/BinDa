#!/bin/bash

docker cp ./keycloak/data/export binda_kc:/tmp/export
docker exec -it binda_kc /opt/keycloak/bin/kc.sh import --dir /tmp/export

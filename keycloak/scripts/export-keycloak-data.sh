#!/bin/bash

docker exec -it bin-da_kc /opt/keycloak/bin/kc.sh export --dir /tmp/export
docker cp bin-da_kc:/tmp/export ./keycloak/data

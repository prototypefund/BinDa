#!/bin/bash

docker exec -it binda_kc /opt/keycloak/bin/kc.sh export --dir /tmp/export
docker cp binda_kc:/tmp/export ./keycloak/data

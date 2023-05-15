#!/bin/bash

docker cp ./keycloak/data/export bin-da_kc:/tmp/export
docker exec -it keycloak-rust-playground /opt/keycloak/bin/kc.sh import --dir /tmp/export

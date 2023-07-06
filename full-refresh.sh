#!/bin/bash
DOCKER=$(which docker)

loadData() {
sleep 30
${DOCKER} exec -it binda_db_api /bin/bash -c 'cat /opt/dump/dump.sql | psql -U $POSTGRES_USER'
echo ""
echo "================================================================"
echo "======================== BinDa Reloaded ========================"
echo "================================================================"
}

$DOCKER compose down
$DOCKER volume rm cyber4edu-dev-binda_binda_db1_data
$DOCKER volume rm cyber4edu-dev-binda_binda_db2_data
$DOCKER compose build
$DOCKER compose -f docker-compose.yml -f docker-compose.ioss.yml up & loadData


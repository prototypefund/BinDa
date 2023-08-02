#/bin/bash
DOCKER=$(which docker)

${DOCKER} exec -it binda_db_api /bin/bash -c 'cat /opt/dump/export.sql | psql -U $POSTGRES_USER'

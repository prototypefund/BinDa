#/bin/bash
DOCKER=$(which docker)

${DOCKER} exec -it binda_db_api /bin/bash -c 'cat /opt/dump/dump.sql | psql -U $POSTGRES_USER'

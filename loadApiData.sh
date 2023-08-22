#!/bin/bash
SELECT=$1

DOCKER=$(which docker)

if [[ "${SELECT}" == "big" ]]; then
  DUMPFILE="dump-big.sql.gz"
else
  DUMPFILE="dump-small.sql.gz"
fi

echo "clean up database"
${DOCKER} exec -it binda_db_api /bin/bash -c 'cat /opt/dump/clean.sql | psql -U $POSTGRES_USER'

echo "used dump file: ${DUMPFILE}"
${DOCKER} exec -it binda_db_api /bin/bash -c "zcat /opt/dump/${DUMPFILE} | psql -U \$POSTGRES_USER"

exit 0

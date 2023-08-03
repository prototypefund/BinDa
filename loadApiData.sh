#!/bin/bash
SELECT=$1

DOCKER=$(which docker)

if [[ "${SELECT}" == "big" ]]; then
  DUMPFILE="dump-big.sql.gz"
else
  DUMPFILE="dump-small.sql.gz"
fi

${DOCKER} exec -it binda_db_api /bin/bash -c 'zcat /opt/dump/clean.sql | psql -U $POSTGRES_USER'

echo "used dump file: $(DUMPFILE)"
cp "./db/binda_api/${DUMPFILE}" './db/binda_api/dump.sql.gz'
${DOCKER} exec -it binda_db_api /bin/bash -c 'zcat /opt/dump/dump.sql.gz | psql -U $POSTGRES_USER'
rm './db/binda_api/dump.sql.gz'

exit 0

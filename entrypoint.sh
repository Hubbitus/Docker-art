#!/usr/bin/env bash

if [[ "$POSTGRES_USER" && "$POSTGRES_PASSWORD" && "$POSTGRES_DB" ]]; then
echo "HI FROM ART entrypoint!"

export PGPASSWORD=$POSTGRES_PASSWORD

psql -h db -U $POSTGRES_USER $POSTGRES_DB -c 'SELECT * FROM ART_DATABASE_VERSION'
	if [[ $? > 0 ]]; then
		echo "Seams DB does not initialised! Try to do so"

		set -e
		sql="psql -qX1n -v ON_ERROR_STOP=1 -h db -U $POSTGRES_USER $POSTGRES_DB"

		echo "Import main tables: art-tables.sql"
		$sql < <( sed 's/ CLOB,/ TEXT,/g' /database/art-tables.sql )
		echo "Import: quartz/tables_postgres.sql"
		$sql < /database/quartz/tables_postgres.sql
		echo "Import: etc/add-foreign-keys.sql"
		$sql < /database/etc/add-foreign-keys.sql
		echo "Import: etc/add-indexes.sql"
		$sql < /database/etc/add-indexes.sql
	fi
fi

/usr/local/tomcat/bin/catalina.sh run

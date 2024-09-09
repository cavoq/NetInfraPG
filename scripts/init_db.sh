#!/bin/bash

export PGPASSWORD=$POSTGRES_PASSWORD

SQL_DIR=/netinfra_pg/sql

# -- Replace default CRS of the database

find /netinfra_pg/sql/ -type f -name "*.sql" | while read -r file; do
        sed -i "s/:DEFAULT_CRS/$DEFAULT_CRS/g" "$file"
done

# -- Create the database

echo "Creating database ${POSTGRES_DB}..."
psql -U "$POSTGRES_USER" -d postgres -c "CREATE DATABASE \"$POSTGRES_DB\";" \
        2>/dev/null || echo "Database ${POSTGRES_DB} already exists, skipping creation."

# -- Initialize the database

for sql_file in $SQL_DIR/init/*.sql; do
        if [ -f "$sql_file" ]; then
                echo "Initializing database with $sql_file..."
                psql -U $POSTGRES_USER -d $POSTGRES_DB -f "$sql_file"
        else
                echo "No SQL files found in $SQL_DIR/init/, skipping initialization..."
        fi
done

unset PGPASSWORD

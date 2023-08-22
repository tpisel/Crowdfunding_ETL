#!/usr/bin/env bash

DB_NAME=crowdfunding_db

echo "Please enter the PostgreSQL password for the 'postgres' user:"
read -s PGPASSWORD
export PGPASSWORD

DB_EXISTS=$(psql -h localhost -U postgres -tAc "SELECT 1 FROM pg_database WHERE datname='$DB_NAME'")

if [ "$DB_EXISTS" = "1" ]; then
    echo "Database $DB_NAME already exists. Exiting."
    exit 1
fi

createdb -h localhost -U postgres $DB_NAME

psql -h localhost -U postgres -d $DB_NAME -f Database/crowdfunding_db_schema.sql

unset PGPASSWORD
#!/bin/sh

while true
do
    # Remove old backup
    echo "Removing old backup"
    rm -rf /backup/*

    # Start new backup
    echo "Dumping database now"
    mysqldump -A -h $DB_HOST -p${DB_PASSWORD} -u $DB_USER -P $DB_PORT > /backup/database_dump.sql

    # Sleep
    echo "Sleeping for ${SLEEP_SECONDS} now"
    sleep $SLEEP_SECONDS
done
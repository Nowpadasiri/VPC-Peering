#!/bin/bash

# Replace with your actual values
SOURCE_HOST="source-db.xxxxx.rds.amazonaws.com"
SOURCE_DB="db10"
SOURCE_USER="admin"

TARGET_HOST="target-db.xxxxx.rds.amazonaws.com"
TARGET_DB="db12"
TARGET_USER="admin"

DUMP_FILE="dump.sql"

echo "Dumping data from source RDS..."
pg_dump -h $SOURCE_HOST -U $SOURCE_USER $SOURCE_DB > $DUMP_FILE

echo "Restoring data to target RDS..."
psql -h $TARGET_HOST -U $TARGET_USER $TARGET_DB < $DUMP_FILE

echo "Database migration completed."

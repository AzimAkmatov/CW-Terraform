#!/bin/bash

# Variables
# Should be improved so it is not hardcoded
DB_HOST=mydb.c9mg00i0olte.us-west-2.rds.amazonaws.com
DB_USER=admin
DB_PASS=password
DB_NAME=mydb
BACKUP_DIR=/home/ubuntu/db_backups

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Perform backup
mysqldump -h $DB_HOST -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_DIR/backup_$(date +%F).sql

echo "Database backup complete."

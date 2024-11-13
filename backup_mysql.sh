#!/bin/bash

#Variables
DB_NAME="test1"
DB_USER="john"
DB_PASS="PASSWORD"
BACKUP_DIR="/var/backups/Databases_Backup"
DATE=$(date +%F)
BACKUP_FILE="${DB_NAME}-${DATE}.sql"

cd /var/backups/Databases_Backup
mkdir -p "$BACKUP_DIR"
#Backup Script
mysqldump -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$BACKUP_FILE"


#Checking
if [ $? -eq 0 ]; then
    echo "Backup for $DB_NAME completed successfully at $BACKUP_FILE."
else
    echo "Backup for $DB_NAME failed."
fi

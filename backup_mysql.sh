#!/bin/bash

#Variables
#DB_NAME="TEST"
#DB_USER="USER"
#DB_PASS="PASSWORD"
BACKUP_DIR="/var/backups/Databases_Backup"
DATE=$(date +%F)
#BACKUP_FILE="${DATE}.sql"

cd /var/backups/Databases_Backup
mkdir -p "$BACKUP_DIR"
#Backup Script for all databases
for DB in $(mysql -e 'show databases' -s --skip-column-names); do
	mysqldump $DB | gzip -c > "${DB}-${DATE}.sql.gz"
done

#Checking
if [ $? -eq 0 ]; then
    echo "Backup for all databases completed successfully at $BACKUP_DIR."
else
    echo "Backup for all databases failed."
fi

#! /usr/bin/bash

#Variables
SOURCE_DIR="mydata/"
BACKUP_DIR="/var/backups"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/mydata-backup-$DATE.tar.gz"

echo "$BACKUP_FILE"
echo "$SOURCE_DIR"
mkdir -p "$BACKUP_DIR"

#Backup Command
cd /home
tar -zcf "$BACKUP_FILE"  "$SOURCE_DIR"

#Checking
if [ $? -eq 0 ]; then
    echo "Backup of $SOURCE_DIR completed successfully at $BACKUP_FILE."
else
    echo "Backup of $SOURCE_DIR failed."
fi

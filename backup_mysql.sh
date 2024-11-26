#!/bin/bash

#Variables

BACKUP_DIR="/var/backups/Databases_Backup"
DATE=$(date +%F)
LOG_FILE="$BACKUP_DIR/backup.log"
TELEGRAM_BOT_TOKEN="your_bot_token"
TELEGRAM_CHAT_ID="your_chat_id"

cd /var/backups/Databases_Backup
mkdir -p "$BACKUP_DIR"

#Backup Script for all databases
for DB in $(mysql -e 'show databases' -s --skip-column-names); do
	mysqldump $DB | gzip -c > "${DB}-${DATE}.sql.gz"
done

#Checking

if [ $? -eq 0 ]; then
    MESSAGE="DATABASES Backup completed successfully: $DATE"
    echo "$(date) - SUCCESS - $MESSAGE" >> "$LOG_FILE"
else
    MESSAGE="DATABASES Backup failed for database: $DB"
    echo "$(date) - ERROR - $MESSAGE" >> "$LOG_FILE"
fi

# Send notification to Telegram
curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
    -d chat_id="$TELEGRAM_CHAT_ID" \
    -d text="$MESSAGE"

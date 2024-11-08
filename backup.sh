#! /usr/bin/bash
#tar -zcvf /var/backups/backuparc.tgz /home/
rsync -av --progress /home/ /var/backups/dataBackup$(date +%Y%m%d_%T)

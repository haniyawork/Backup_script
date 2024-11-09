#! /usr/bin/bash
cd /home/hani
tar -zcvf dataBackup$(date +%Y%m%d_%T).tgz mydata/
rsync -ar /mydata John@$(ip_address):/home/backups

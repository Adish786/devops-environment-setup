#!/bin/bash
# Task 3: Backup Nginx

BACKUP_DIR="/backups"
LOG_FILE="/var/log/backup/nginx_backup.log"
DATE=$(date +%F)

mkdir -p $BACKUP_DIR
mkdir -p /var/log/backup

BACKUP_FILE="$BACKUP_DIR/nginx_backup_$DATE.tar.gz"

# Backup config + document root
tar -czf $BACKUP_FILE /etc/nginx/ /usr/share/nginx/html/ 2>> $LOG_FILE

# Verify backup
echo "[$(date)] Backup created: $BACKUP_FILE" >> $LOG_FILE
tar -tzf $BACKUP_FILE >> $LOG_FILE 2>&1
sha256sum $BACKUP_FILE > $BACKUP_FILE.sha256
echo "[$(date)] Checksum created: $BACKUP_FILE.sha256" >> $LOG_FILE

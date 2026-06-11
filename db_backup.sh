#!/bin/bash
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_DIR=/var/backups/postgresql
FILENAME=$BACKUP_DIR/sre_training_$DATE.sql

sudo -u postgres pg_dump sre_training > $FILENAME
echo "Backup created: $FILENAME"

find $BACKUP_DIR -name "*.sql" -mtime +7 -delete
echo "Old backups cleaned up"

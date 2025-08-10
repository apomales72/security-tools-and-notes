#!/bin/bash
# backup.sh
# Simple automated backup script

# Variables
SOURCE_DIR="/home/username/data"       # Folder to back up
BACKUP_DIR="/home/username/backups"    # Where backups will be stored
DATE=$(date +%F_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Create backup
tar -czf "$BACKUP_FILE" "$SOURCE_DIR"

# Optional: Remove backups older than 7 days
find "$BACKUP_DIR" -type f -mtime +7 -delete

echo "Backup completed at $DATE"

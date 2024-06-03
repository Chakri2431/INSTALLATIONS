#!/bin/bash

# Variables
SOURCE_DIR="/path/to/source/directory"
BACKUP_DIR="/path/to/backup/directory"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
ARCHIVE_NAME="backup-$TIMESTAMP.tar.gz"

# Create a backup
tar -czf $BACKUP_DIR/$ARCHIVE_NAME $SOURCE_DIR

# Print success message
echo "Backup completed successfully. Archive created: $BACKUP_DIR/$ARCHIVE_NAME"


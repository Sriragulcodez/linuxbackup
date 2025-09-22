#!/bin/bash

BACKUP_DIR="./backups"
LOG_FILE="backup_log.txt"

mkdir -p "$BACKUP_DIR"

echo "Welcome to Simple Backup Manager!"
read -p "Enter folder path to backup: " folder

if [ ! -d "$folder" ]; then
    echo "Error: Folder does not exist!"
    exit 1
fi

timestamp=$(date +%Y%m%d_%H%M%S)
backup_file="$BACKUP_DIR/$(basename "$folder")_$timestamp.tar.gz"

tar -czvf "$backup_file" "$folder"
echo "$(date): Backup of $folder -> $backup_file" >> "$LOG_FILE"

echo "Backup completed! File: $backup_file"


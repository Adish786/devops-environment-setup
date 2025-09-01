#!/bin/bash
# Verify any backup file

if [ -z "$1" ]; then
  echo "Usage: $0 <backup_file.tar.gz>"
  exit 1
fi

BACKUP_FILE=$1

echo "Verifying $BACKUP_FILE..."
tar -tzf $BACKUP_FILE || { echo "Invalid archive"; exit 1; }

if [ -f "$BACKUP_FILE.sha256" ]; then
  sha256sum -c "$BACKUP_FILE.sha256"
else
  echo "Checksum file not found"
fi

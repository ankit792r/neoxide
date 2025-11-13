#!/bin/bash
# A simple script to temporarily rename .gitb -> .git, pull updates, and rename back.

set -e  # Exit immediately if a command exits with a non-zero status

# Define directories
GIT_DIR=".git"
GIT_BACKUP_DIR=".gitb"

# Check if .gitb exists and .git does not
if [ -d "$GIT_BACKUP_DIR" ] && [ ! -d "$GIT_DIR" ]; then
    echo "Renaming $GIT_BACKUP_DIR to $GIT_DIR..."
    mv "$GIT_BACKUP_DIR" "$GIT_DIR"
else
    echo "Either $GIT_BACKUP_DIR doesn't exist or $GIT_DIR already exists."
    echo "Aborting."
    exit 1
fi

# Run git pull
echo "Running git pull..."
git pull

# Rename back .git -> .gitb
echo "Renaming $GIT_DIR back to $GIT_BACKUP_DIR..."
mv "$GIT_DIR" "$GIT_BACKUP_DIR"

echo "Done!"

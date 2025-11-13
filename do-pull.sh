#!/bin/bash
# Script to manage git pull when repo metadata is stored as .gitb instead of .git

set -e  # Exit immediately if a command exits with a non-zero status

GIT_DIR=".git"
GIT_BACKUP_DIR=".gitb"

if [ -d "$GIT_BACKUP_DIR" ] && [ ! -d "$GIT_DIR" ]; then
    echo "Detected $GIT_BACKUP_DIR. Renaming to $GIT_DIR..."
    mv "$GIT_BACKUP_DIR" "$GIT_DIR"
    echo "Running git pull..."
    git pull
    echo "Renaming $GIT_DIR back to $GIT_BACKUP_DIR..."
    mv "$GIT_DIR" "$GIT_BACKUP_DIR"
    echo "Done!"
elif [ -d "$GIT_DIR" ]; then
    echo "Detected $GIT_DIR. Running git pull..."
    git pull
    echo "Renaming $GIT_DIR to $GIT_BACKUP_DIR..."
    mv "$GIT_DIR" "$GIT_BACKUP_DIR"
    echo "Done!"
else
    echo "Neither $GIT_DIR nor $GIT_BACKUP_DIR found. Are you in a valid repo?"
    exit 1
fi

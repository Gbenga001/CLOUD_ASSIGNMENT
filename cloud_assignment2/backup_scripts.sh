#!/bin/bash

# Check if source directory is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

timestamp=$(date '+%Y_%m_%d_%H-%M-%S')
source_directory="$1"
destination_directory="$2"
backup_directory="$destination_directory$timestamp.tar.gz"

# Check if source directory exists
if [ ! -d "$source_directory" ]; then
    echo "Error: Source directory does not exist."
    exit 1
fi

# Create backup
sudo tar -czf "$backup_directory" "$source_directory"

# Print backup directory
echo "Backup created at: $backup_directory"

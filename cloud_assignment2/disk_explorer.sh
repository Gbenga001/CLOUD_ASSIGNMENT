#!/bin/bash

num_entries=8
list_directories=false

# loop through directory
while [[ $# -gt 0 ]]; do
    case $1 in
        -d)
            list_directories=true
            ;;
        -n)
            num_entries=$2
            shift
            ;;
        *)
            break
            ;;
    esac
    shift
done

# The last argument is the directory to explore
directory=$1

# check if -d is provided
if [ "$list_directories" = true ]; then
    # List files and directories
    ls -l $directory
elif [ "$num_entries" -gt 0 ]; then
    # List the top N entries by disk usage
    du -h $directory | sort -rh | head -$num_entries
else
    # Default: List 8 entries by disk usage
    du -h $directory | sort -rh | head -8
fi


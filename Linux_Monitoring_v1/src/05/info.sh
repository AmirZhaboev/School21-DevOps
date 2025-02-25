#!/bin/bash

silent_run() {
    "$@" 2>/dev/null
}

start_time=$(date +%s.%N)

#Number of folders
folder_count=$(silent_run find "$directory" -type d | wc -l)

#Top 5 folders
folder_sizes=$(silent_run du -sh "$directory"* | sort -rh | head -n 5 | awk '{printf "%d - %s %s\n", NR, $2, $1}')
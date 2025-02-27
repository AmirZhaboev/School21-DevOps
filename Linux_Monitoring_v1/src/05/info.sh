#!/bin/bash

silent_run() {
    "$@" 2>/dev/null
}

start_time=$(date +%s.%N)

#Number of folders
folder_count=$(silent_run find "$1" -type d | wc -l)

#Top 5 folders
folder_sizes=$(silent_run du -sh "$1"* | sort -rh | head -n 5 | awk '{printf "%d - %s, %s\n", NR, $2, $1}')

#Number of files 
file_count=$(silent_run find "$1" -type f | wc -l)

#Number of .conf files
conf_file_count=$(silent_run find "$1" -type f -name "*.conf" | wc -l)

#Number of .txt files
txt_file_count=$(silent_run find "$1" -type f -name "*.txt" | wc -l)

#Number of .exe files
exe_file_count=$(silent_run find "$1" -type f -executable | wc -l)

#Number of .log files
log_file_count=$(silent_run find "$1" -type f -name "*.log" | wc -l)

#Number of archive files
archive_file_coint=$(silent_run find "$1" -type f -name "*.zip" -o -name "*.7z" -o -name "*.rar" -o -name "*.tar" | wc -l)

#Number of links
links_file_count=$(silent_run find "$1" -type l | wc -l)

#Top 10 files by zise
top_10_files=$(silent_run find "$1" -type f -exec du -h {} + | sort -rh | head -n 10 | awk '{type=($2); split(type, a, "."); printf "%d - %s, %s, %s \n", NR, $2, $1, a[length(a)]}'
)

#Top 10 exec files
top_10_exec_files=$(silent_run find "$1" -type f -executable -exec du -h {} + | sort -rh | head -n 10 | awk '{file=$2; cmd="md5sum " file; cmd | getline md5; close(cmd); split(md5, arr, " "); printf "%d - %s, %s, %s\n", NR, $2, $1, arr[1]}'
)

end_time=$(date +%s.%N)
execution_time=$(printf "%.6f" $(echo "$end_time - $start_time" | bc))
#!/bin/bash

cat <<EOF
Total number of folders (including all nested ones) = $folder_count
TOP 5 folders of maximum size arranged in descending order (without inner folders):
$folder_sizes
Total number of files = $file_count
Number of:
Configuration files (with the .conf extension) = $conf_file_count
Text files = $txt_file_count
Executable files = $exe_file_count
Log files (with the extension .log) = $log_file_count
Archive files = $archive_file_coint
Symbolic links = $links_file_count
TOP 10 files of maximum size arranged in descending order (path, size and type):
$top_10_files
TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):  
$top_10_exec_files
Script execution time (in seconds) = $execution_time
EOF
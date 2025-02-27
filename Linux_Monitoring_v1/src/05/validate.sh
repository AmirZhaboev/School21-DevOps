#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 /path/to/directory/"
  exit 1
fi

if [[ ! "$1" =~ /$ ]]; then
  echo "Path must end with '/'"
  exit 1
fi

if [ ! -d "$1" ]; then
  echo "The path $1 does not exist or is not a directory"
  exit 1
fi
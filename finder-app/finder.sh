#!/bin/bash

search_dir=$1
search_string=$2

if [ -z "$search_dir" ]
then
    echo "Search directory not specified!" >> /dev/stderr
    exit 1
fi

if [ -z "$search_string" ]
then
    echo "Search string not specified!" >> /dev/stderr
    exit 1
fi

if [ -d "$search_dir" ]
then
    file_count=$(find $1 -type f | wc -l)
    match_count=$(grep -roh $search_string $search_dir | wc -w)
    echo "The number of files are $file_count and the number of matching lines are $match_count"

else
    echo "Directory specified does not exist!" >> /dev/stderr
    exit 1
fi

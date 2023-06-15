#!/bin/bash

write_path=$1
write_string=$2

if [ -z "$write_path" ];
then
    echo "Write directory not specified!" >> /dev/stderr
    exit 1
fi

if [ -z "$write_string" ];
then
    echo "Write string not specified!" >> /dev/stderr
    exit 1
fi

if [ ! -d $(dirname $write_path) ];
then
    mkdir -p $(dirname $write_path)
fi

echo $write_string > $write_path

if [ ! $? -eq 0 ];
then
    echo "Write failed!" >> /dev/stderr
    exit 1
fi

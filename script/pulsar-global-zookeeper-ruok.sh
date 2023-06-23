#!/usr/bin/env bash

# Check ZK server status

status=$(echo ruok | nc -q 1 localhost 2184)
if [ "$status" == "imok" ]; then
    exit 0
else
    echo "ZK server is not ok"
    exit 1
fi

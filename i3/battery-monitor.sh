#!/bin/bash
while true; do
    ./batter_notification.sh >> battery_log.txt  # Append output to a log file
    sleep 30
done

#!/bin/bash

# Run headsetcontrol and capture output
output=$(headsetcontrol -b 2>/dev/null)

# Extract battery status and level
status=$(echo "$output" | grep "Status" | awk '{print $2}')
level=$(echo "$output" | grep "Level" | awk '{print $2}' | tr -d '%')

# Check if the output contains valid battery info
if [[ -z "$status" || -z "$level" ]]; then
     env DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "Headset Battery" "Error: Could not retrieve battery status"
    exit 1
fi

# Customize the message
message="Battery Status: $status\nBattery Level: $level%"

# Send notification
env DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send -i battery "SteelSeries Arctis 7+" "$message"


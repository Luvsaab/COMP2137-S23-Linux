#!/bin/bash

# Get the hostname
hostname=$(hostname)

# Get the IP address
ip_address=$(hostname -I | awk '{print $1}')

# Get the gateway IP
gateway=$(ip route | awk '/default/ {print $3}')

# Check internet connectivity
ping -c 1 google.com > /dev/null 2>&1
if [ mycmd? -eq 0 ]; then
    status="Online"
else
    status="Offline"
fi

# Display the information
echo "Hostname: $hostname"
echo "IP Address: $ip_address"
echo "Gateway IP: $gateway"
echo "Status: $status"


#!/bin/bash

# Get the hostname
hostname=$(hostname)

# Get the IP address
ip_address=$(hostname -I | awk '{print $1}')

# Get the gateway IP address
gateway=$(ip route | grep default | awk '{print $3}')

# Check internet connectivity
ping -c 1 google.com &> /dev/null

# Check the return code of the ping command
if [[ $? -eq 0 ]]; then
    status="Online"
else
    status="Offline"
fi

# Display the information
echo "Hostname: $hostname"
echo "IP Address: $ip_address"
echo "Gateway IP Address: $gateway"
echo "Status: $status"


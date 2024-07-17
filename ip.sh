#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <file_with_ips>"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "File not found!"
    exit 1
fi

while IFS= read -r ip; do
    if [[ ! -z "$ip" ]]; then
        echo "Denying IP: $ip"
        sudo ufw deny from "$ip"
    fi
done < "$1"

echo "All IPs have been processed."

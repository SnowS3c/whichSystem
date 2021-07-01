#!/bin/bash

if [ "$1" ]; then
        ip="$1"
else
        echo "[!] Error: Missing IP"
        exit 1
fi

if ttl=$(ping -c 1 "$ip" | grep -E "^64 bytes" | awk {'print $6'} | sed 's/ttl=//') && [ "$ttl" ]; then
        if [ "$ttl" -gt 64 ] && [ "$ttl" -lt 129 ]; then
                echo "[+] Host System is Windows"
        elif [ "$ttl" -gt 0 ] && [ "$ttl" -lt 65 ]; then
                echo "[+] Host System is Linux"
        else
                echo "[!] System unknow"
        fi
else
        echo "[!] Error: Host Down"
        exit 2
fi

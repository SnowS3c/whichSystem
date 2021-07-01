#!/bin/bash

if [ "$1" ]; then
        ip="$1"
else
        echo -e "\n[!] Error: Missing IP\nUsage: $0 ip\nExample: $0 10.10.10.10\n"                       
        exit 1
fi


if ttl=$(ping -c 1 "$ip" | grep -E "^64 bytes" | awk {'print $6'} | sed 's/ttl=//') && [ "$ttl" ]; then  
        if [ "$ttl" -gt 64 ] && [ "$ttl" -lt 129 ]; then                                                 
                echo -e "\n[+] Host System is Windows\n"                                                 
        elif [ "$ttl" -gt 0 ] && [ "$ttl" -lt 65 ]; then                                                 
                echo -e "\n[+] Host System is Linux\n"                                                   
        else
                echo -e "\n[!] System unknow\n"
        fi
else
        echo -e "\n[!] Error: Host Down\n"
        exit 2
fi

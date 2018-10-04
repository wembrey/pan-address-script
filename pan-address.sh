#!/bin/bash
while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "set address H-$line ip-netmask $line/32"
    echo "set address H-$line ip-netmask $line/32" >> address-set.txt
done < "$1"

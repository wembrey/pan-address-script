# pan-address-script
Takes a list of IPs from a file and creates cli config to paste

Grab an export from the firewall fro monitor tab for entries you want and export to CVS and fetch the IP list 

$ awk '{print $11 }' log.csv.txt | sort | uniq.exe > ip-list

Then when you have the list of IPs in the format
1.1.1.1
1.1.1.2
1.1.1.3

You can use the script to quickly gen a pasteable output

$ cat ./script/pan-address.sh
#!/bin/bash
while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "set address H-$line ip-netmask $line/32"
    echo "set address H-$line ip-netmask $line/32" >> address-set.txt
done < "$1"

Paste the contents into the firewall CLI config mode.

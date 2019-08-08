#!/bin/sh
declare -i COUNT
FILE="/var/named/tom.flz"
FILEPTR="/var/named/tom.rlz"
COUNT=1
while test $COUNT -lt 10
do
        echo -e "\tIN\tNS\tdnsworker$COUNT.tom.local." >> $FILE
        echo -e "dnsworker$COUNT\tIN\tA\t192.168.0.$COUNT" >> $FILE
        echo -e "\tIN\tNS\tdnsworker$COUNT.tom.local." >> $FILEPTR
        echo -e "$COUNT\tIN\tPTR\tdnsworker.tom.local.$COUNT" >> $FILEPTR
COUNT=$COUNT+1
done
less $FILE
less $FILEPTR
systemctl restart named

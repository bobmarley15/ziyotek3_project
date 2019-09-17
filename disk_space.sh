#!/bin/sh
df -m |awk '{ print $4 " " $1 }' | while read output;
do
  usep=$(echo $output | awk '{ print $1}')
  partition=$(echo $output | awk '{ print $2 }' )
  if [ $usep -lt 500 ]; then
echo "Running out of space \"$partition ${usep}M\" on $(hostname) as on $(date)" #|
# mail -s "Alert: Almost out of disk space ${usep}M" linuxadmins@tom.local.com
  fi
done

#!/bin/bash

for  ip in `cat /ansible/nfsfiles/inventory`
do
ssh-copy-id  -i ~/.ssh/id_rsa.pub ansible@$ip
done


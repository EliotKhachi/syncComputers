#!/bin/bash

## Update snap.txt and apt.txt
snap list | awk 'NR>1 {print $1}' > snap.txt
aptitude search '~i!~M' -F '%p' > apt.txt

DISK_MOUNT_PATH="/mnt/backup"
DISK_DEVICE="/dev/sda"
repo="/home/$USER/Public/repos/syncComputers/"

## Sync directories to backup server. Exclude directories that are not needed.
sudo rsync -avxz -e "ssh -i /home/$USER/.ssh/rpi" --log-file=$repo/push.log --partial-dir=partial \
    --exclude-from=exclude.txt \
    /home/$USER/ $PI_USERNAME@$PI_ADDRESS:$DISK_MOUNT_PATH/home/$USER/

## Update git repository
git -C $repo/syncComputers add .
git -C $repo commit -m "Computers synced on $(date)"
git -C $repo push

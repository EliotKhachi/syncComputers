#!/bin/bash

## Get root permissions user
echo "Enter root credentials:"
sudo echo ""
## Update snap.txt and apt.txt
echo "Updating snap.txt..."  
snap list | awk 'NR>1 {print $1}' > snap.txt
sleep 1 
echo "Updating apt.txt..."  
aptitude search '~i!~M' -F '%p' > apt.txt
sleep 1

DISK_MOUNT_PATH="/mnt/backup"
DISK_DEVICE="/dev/sda"
repo="/home/$USER/Public/repos/syncComputers/"

## Push home directories to backup server. Exclude directories that are not needed.
echo "Pushing home directory..."
sudo rsync -avxzq -e "ssh -i /home/$USER/.ssh/rpi" --log-file=$repo/push.log --partial-dir=partial \
    --exclude-from=exclude.txt \
    --include-from=include.txt \
    /home/$USER/ $PI_USERNAME@$PI_ADDRESS:$DISK_MOUNT_PATH/home/$USER/

## Update git repository
git -C $repo add .
git -C $repo commit -m "Pushed home dir from $HOSTNAME to server"
git -C $repo push

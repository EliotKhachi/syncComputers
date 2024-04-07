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

repo="/home/$USER/Public/repos/syncDirectories/"

## Push home directories to backup server. Exclude directories that are not needed.
echo "Pushing home directory..."
sudo rsync -avxzq -e "ssh -i /home/$USER/.ssh/rpi" --log-file=$repo/push.log --partial-dir=partial \
    --exclude-from=exclude.txt \
    --include-from=include.txt \
    /home/$USER/ /mnt/nfs/home

## Update git repository
git -C $repo add .
git -C $repo commit -m "Pushed home dir from $HOSTNAME to server"
git -C $repo push

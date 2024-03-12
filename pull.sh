#!/bin/bash
DISK_MOUNT_PATH="/mnt/backup"
DISK_DEVICE="/dev/sda"
repo="/home/$USER/Public/repos/syncComputers/"

# Get root permissions user
echo "Enter root credentials:"
sudo echo ""
# Get latest version of scripts (update snap.txt, exclude.txt, and apt.txt)
echo "Pulling latest version of git repository..."
git -C $repo pull origin main

# Sync directories to backup server. Exclude directories that are not needed.
echo "Syncing home directories..."
 sudo rsync -avxzq -e "ssh -i /home/$USER/.ssh/rpi" --log-file=$repo/pull.log \
     --exclude-from=exclude.txt \
     --include-from=include.txt \
    $PI_USERNAME@$PI_ADDRESS:$DISK_MOUNT_PATH/home/$USER/ /home/$USER/

# Install snap packages
echo "Installing snap packages..."
for package in $(cat snap.txt)
do
    sudo snap install --classic $package
done

## Add Ubuntu repositories
echo "Adding Ubuntu repositories..."
for repository in {main,universe,multiverse,restricted}
do 
    sudo add-apt-repository -y $repository
done

## Update Apt Packages
echo "Updating apt packages..."
sudo apt-get -qq update && sudo apt-get -qq upgrade

## Add Apt Packages
echo "Installing apt packages..."
for package in $(cat apt.txt)
do
    sudo apt-get -qq install -y $package
done

## Run any other commands
sudo ./other.sh

# Fix any broken / unmet dependencies
echo "Fixing broken / unmet dependencies..."
sudo apt-get -qq --fix-broken install -y

git -C $repo add .
git -C $repo commit -m "Pulled home dir from server to $HOSTNAME."
git -C $repo push

#!/bin/bash
DISK_MOUNT_PATH="/mnt/backup"
DISK_DEVICE="/dev/sda"
repo="/home/$USER/Public/repos/syncComputers/"

# Get latest version of scripts (update snap.txt, exclude.txt, and apt.txt)
git -C $repo pull origin

# Sync directories to backup server. Exclude directories that are not needed.
 sudo rsync -avxz -e "ssh -i /home/$USER/.ssh/rpi" --exclude-from=exclude.txt \
    $PI_USERNAME@$PI_ADDRESS:$DISK_MOUNT_PATH/home/$USER/ /home/$USER/

# Install snap packages
for package in $(cat snap.txt)
do
    sudo snap install --classic $package
done

## Add Ubuntu repositories
for repository in {main,universe,multiverse,restricted}
do 
    sudo add-apt-repository -y $repository
done

## Update Apt Packages
sudo apt-get update && sudo apt-get upgrade

## Add Apt Packages
for package in $(cat apt.txt)
do
    sudo apt-get install -y $package
done
# Fix any broken / unmet dependencies
sudo apt --fix-broken install -y

## Run other commands
file="other.txt"
# Check if the file exists
if [ ! -f "$file" ]; then
    echo "Error: File $file not found."
    exit 1
fi

# Iterate over each line in the file and execute it as a command
while IFS= read -r line; do
    # Skip lines that start with a # or are empty
    if [[ $line =~ ^[[:space:]]*# || -z $line ]]; then
        continue
    fi
    # Execute the command
    eval "$line"
done < "$file"

#!/bin/bash
## Install npm
if command -v npm  &> /dev/null; then
    echo "npm is installed. Version: $(npm --version)"
else
    echo "Installing npm..."
    sudo apt -qq install npm
    if [ $? -ne 0 ]; then
        echo "An error occurred while installing npm."
    else
        echo "npm was installed succesfully."
    fi
fi

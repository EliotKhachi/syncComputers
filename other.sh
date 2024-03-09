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

## Install miniconda3
if command -v conda &> /dev/null; then
    echo "conda is installed. Version: $(conda --version)"
else
    echo "Installing conda..."
    sudo mkdir -p /opt/miniconda3
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /opt/miniconda3/miniconda.sh
    bash /opt/miniconda3/miniconda.sh -b -u -p /opt/miniconda3
    if [ $? -ne 0 ]; then
        echo "An error occurred while installing conda." 
    else
        echo "conda was installed succesfully."
    fi
    rm -rf /opt/miniconda3/miniconda.sh
fi

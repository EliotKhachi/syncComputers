#!/bin/bash
## Install miniconda3
if command -v conda &> /dev/null; then
    echo "conda is installed. Version: $(conda --version)"
else
    echo "Installing conda..."
    sudo mkdir -p /opt/miniconda3
    sudo wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /opt/miniconda3/miniconda.sh
    sudo bash /opt/miniconda3/miniconda.sh -b -u -p /opt/miniconda3
    if [ $? -ne 0 ]; then
        echo "An error occurred while installing conda."
    else
        echo "conda was installed succesfully."
    fi
    sudo rm -rf /opt/miniconda3/miniconda.sh
fi

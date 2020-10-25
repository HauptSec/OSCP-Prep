#!/bin/bash

# Install Tools
sudo cp ../Scripts/1-Recon/nmapAutomator.sh /usr/local/bin/nmapAutomator
git -C ~/Tools clone https://github.com/maurosoria/dirsearch.git

# Update PATH
cat PATH >> ~/.zshrc
source ~/.zhsrc
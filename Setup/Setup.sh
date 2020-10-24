#!/bin/bash

# Install Tools
sudo curl https://raw.githubusercontent.com/Ahaupt3/OSCP-Prep/main/Scripts/1%20-%20Recon/nmapAutomator.sh -o /usr/bin/local/nmapAutomator
git -C ~/Tools clone https://github.com/maurosoria/dirsearch.git
sudo apt install -y proxychains4

# Update PATH
sudo curl https://raw.githubusercontent.com/Ahaupt3/OSCP-Prep/main/Setup/PATH >> ~/.zshrc
source ~/.zhsrc
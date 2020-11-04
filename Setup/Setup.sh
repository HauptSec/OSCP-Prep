#!/bin/bash

GREEN='\033[0;32m'
BOLD='\033[1m'
YELLOW='\033[0;33m'

if [ ! -d ~/Tools ]; then
    mkdir ~/Tools || exit
fi

# Link Python3/Pip3 to Python/Pip command
echo -e "${GREEN}${BOLD}Linking Python3/Pip3 to Python/Pip${YELLOW}"
sudo rm /usr/bin/python
sudo ln -s /usr/bin/python3 /usr/bin/python
sudo apt install -y python3-pip
sudo rm /usr/bin/pip
sudo ln -s /usr/bin/pip3 /usr/bin/pip
echo -e ""

# Install Required Tools
echo -e "${GREEN}${BOLD}Installing nmapAutomator${YELLOW}"
sudo curl https://raw.githubusercontent.com/Ahaupt3/OSCP-Prep/main/Scripts/1-Recon/nmapAutomator.sh -o /usr/local/bin/nmapAutomator && sudo chmod +x /usr/local/bin/nmapAutomator
echo -e ""

echo -e "${GREEN}${BOLD}Installing kickoffscans${YELLOW}"
sudo curl https://raw.githubusercontent.com/Ahaupt3/OSCP-Prep/main/Scripts/1-Recon/kickoffscans.sh -o /usr/local/bin/kickoffscans && sudo chmod +x /usr/local/bin/kickoffscans
echo -e ""

echo -e "${GREEN}${BOLD}Installing dirsearch${YELLOW}"
git -C ~/Tools clone https://github.com/maurosoria/dirsearch.git && cd ~/Tools/dirsearch && mv dirsearch.py dirsearch && cd ~ || exit
echo -e ""

echo -e "${GREEN}${BOLD}Installing autorecon${YELLOW}"
sudo python -m pip install git+https://github.com/Tib3rius/AutoRecon.git
echo -e ""

echo -e "${GREEN}${BOLD}Installing reconnoitre${YELLOW}"
git -C ~/Tools clone https://github.com/codingo/Reconnoitre.git && cd ~/Tools/Reconnoitre && sudo python setup.py install && cd ~ || exit
echo -e ""

# Install Additional Tools
echo -e "${GREEN}${BOLD}Installing evil-winrm${YELLOW}"
sudo gem install evil-winrm
echo -e ""

echo -e "${GREEN}${BOLD}Installing proxychains4${YELLOW}"
sudo apt install -y proxychains4
echo -e ""

# Update PATH
echo -e "${GREEN}${BOLD}Updating PATH${YELLOW}"
if [ -f .zshrc ]
then
    echo "" >> ~/.zshrc
    curl https://raw.githubusercontent.com/Ahaupt3/OSCP-Prep/main/Setup/PATH >> ~/.zshrc
    echo -e "${GREEN}Finished - Run: source ~/.zshrc"
else
    echo "" >> ~/.bashrc
    curl https://raw.githubusercontent.com/Ahaupt3/OSCP-Prep/main/Setup/PATH >> ~/.bashrc
    echo -e "${GREEN}Finished - Run: source ~/.bashrc"
fi

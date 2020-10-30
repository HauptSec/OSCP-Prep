#!/bin/bash

SCRDIR=../Scripts/1-Recon

# Link Python3/Pip3 to Python/Pip command
sudo ln -s /usr/bin/python3 /usr/bin/python
sudo apt install -y python3-pip
sudo ln -s /usr/bin/pip3 /usr/bin/pip

# Install Tools
sudo cp "$SCRDIR"/nmapAutomator.sh /usr/local/bin/nmapAutomator
sudo cp "$SCRDIR"/kickoff-scans.sh /usr/local/bin/kickoffscans
git -C ~/Tools clone https://github.com/maurosoria/dirsearch.git && cd dirsearch && mv dirsearch.py dirsearch && cd ..
sudo python -m pip install git+https://github.com/Tib3rius/AutoRecon.git
git -C ~/Tools clone https://github.com/codingo/Reconnoitre.git && cd Reconnoitre && sudo python setup.py install && cd ..
sudo gem install evil-winrm

# Update PATH
cat PATH >> ~/.zshrc
source ~/.zhsrc

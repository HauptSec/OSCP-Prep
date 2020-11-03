#!/bin/bash

# Usage
# kickoffscans IP1 IP2 IP3 IP4 IP5

# Create Exam directory
mkdir ~/Documents/OSCP-Exam && cd ~/Documents/OSCP-Exam || exit
for IP in "${[@]}"; do mkdir --parents "$IP"/Scans/nmapAutomator "$IP"/Scans/reconnoitre "$IP"/Scans/autorecon; done || exit

# nmapAutomator
for IP in "${[@]}"; do nmapAutomator "$IP" All; done

# reconnoitre
for IP in "${[@]}"; do reconnoitre -t "$IP" --dns --snmp --services --hostnames --virtualhosts -o "$IP"/Scans/reconnoitre; done

# autorecon
for IP in "${[@]}"; do autorecon "$IP" --only-scans-dir -o autorecon; done
for IP in "${[@]}"; do mv autorecon/"$IP"/scans/* "$IP"/Scans/autorecon; done
rm -r autorecon
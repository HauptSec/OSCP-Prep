#!/bin/bash

# Update IPs before running
IPS=('<ip1>' '<ip2>' '<ip3>' '<ip4>' '<ip5>')

# Create Exam directory
mkdir ~/Documents/OSCP-Exam && cd ~/Documents/OSCP-Exam || exit

# nmapAutomator
for IP in "${IPS[@]}"; do nmapAutomator "$IP" All; done

# autorecon
for IP in "${IPS[@]}"; do autorecon "$IP" --only-scans-dir -o autorecon; done
for IP in "${IPS[@]}"; do cp autorecon/"$IP"/scans "$IP"/Scans/autorecon; done

# reconnoitre
for IP in "${IPS[@]}"; do Reconnoitre -t "$IP" --dns --snmp --services --hostnames --virtualhosts; done
for IP in "${IPS[@]}"; do cp reconnoitre/"$IP"/scans "$IP"/Scans/reconnoitre; done

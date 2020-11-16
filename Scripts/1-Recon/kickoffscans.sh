#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[0;33m'

EXAMDIR=~/OSCP-Exam
SCANDIRS=(Scans/{nmapAutomator,autorecon})

# Usage
# kickoffscans IP1 IP2 IP3 IP4 IP5

usage() {
    echo -e "${GREEN}Usage: $0 <IP1> <IP2> <IP3> ..."
    echo -e ""
    exit 1
}

if [ 0 -ge "$#" ]; then
	echo -e ""
	echo -e "${YELLOW}ERROR: Provide at least one valid IP"
	usage
fi

for IP in "$@"; do
    if [[ "$1" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
	        :
    else
        echo -e ""
        echo -e "${YELLOW}ERROR: Invalid IP arguments" 
        usage
    fi
done

# Create Exam directory
if [ ! -d "$EXAMDIR" ]; then
	mkdir "$EXAMDIR" || exit
fi

cd "$EXAMDIR" || exit

for IP in "$@"; do
	for DIR in "${SCANDIRS[@]}"; do
		if [ ! -d "$IP"/"$DIR" ]; then
			mkdir -p "$IP"/"$DIR"
		fi
	done
done

# nmapAutomator
for IP in "$@"; do nmapAutomator "$IP" All; done

# autorecon
for IP in "$@"; do autorecon "$IP" --only-scans-dir -o autorecon; done
for IP in "$@"; do mv autorecon/"$IP"/scans/* "$IP"/Scans/autorecon; done

rm -r autorecon

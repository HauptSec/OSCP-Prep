# Setup

Run the [Setup](Setup/Setup.sh) script to automate the steps below.

## Install Tools

- [Modified nmapAutomator](Scripts/nmapAutomator)
  - `sudo curl https://raw.githubusercontent.com/Ahaupt3/OSCP-Prep/main/Scripts/1-Recon/nmapAutomator -o /usr/bin/local/nmapAutomator`
- [Dirsearch](https://github.com/maurosoria/dirsearch)
  - `git -C ~/Tools clone https://github.com/maurosoria/dirsearch.git`
- [ProxyChains4](https://github.com/haad/proxychains)
  - `sudo apt install -y proxychains4`
- []()
  - <command>
- []()
  - <command>

## Add to Path

- Append to RC file:

```shell
export PATH=$PATH:$HOME/Tools/dirsearch # dirsearch
```

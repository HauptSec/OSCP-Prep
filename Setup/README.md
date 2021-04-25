# Setup

> Run the [Setup](Setup.sh) script to automate the steps below.
>
> - `git clone https://github.com/Ahaupt3/OSCP-Prep && cd OSCP-Prep/Setup && sudo ./Setup.sh`

## Nix-Setup

> - *Optional*: See this Repo for my normal *NIX box setup - [Nix-Setup](https://github.com/Ahaupt3/Nix-Setup)

## Install Tools

### Required for Scripts

> - [Modified nmapAutomator](/Scripts/1-Recon/nmapAutomator.sh)
>   - `sudo curl https://raw.githubusercontent.com/Ahaupt3/OSCP-Prep/main/Scripts/1-Recon/nmapAutomator.sh -o /usr/local/bin/nmapAutomator && sudo chmod +x /usr/local/bin/nmapAutomator`
> - [AutoRecon](https://github.com/Tib3rius/AutoRecon)
>   - `sudo python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git`
> - [Kickoffscans](/Scripts/1-Recon/kickoffscans.sh)
>   - `sudo curl https://raw.githubusercontent.com/Ahaupt3/OSCP-Prep/main/Scripts/1-Recon/kickoffscans.sh -o /usr/local/bin/kickoffscans && sudo chmod +x /usr/local/bin/kickoffscans`

### Additional Tools

> - [Evil-WinRM](https://github.com/Hackplayers/evil-winrm)
>   - `sudo gem install evil-winrm`
> - [ffuf](https://github.com/ffuf/ffuf/)
>   - `sudo apt install -y golang`
>   - `go get -u github.com/ffuf/ffuf`
> - [ProxyChains4](https://github.com/haad/proxychains)
>   - `sudo apt install -y proxychains4`

## Add to Path

> - Append to RC file:
>
> ```shell
> export PATH=$PATH:$HOME/Tools/Reconnoitre # Reconnoitre
> export PATH="${PATH}":/usr/share/doc/python3-impacket/examples/ # Impacket
> export PATH="${PATH}":~/go/bin # Go binaries - ffuf
> ```

## Symlink to Home DIR

> - /usr/share/seclists
> - /usr/share/wordlists
> - /usr/share/doc/python3-impacket/examples

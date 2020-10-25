# Setup

> Run the [Setup](Setup.sh) script to automate the steps below.
>
> - `git clone https://github.com/Ahaupt3/OSCP-Prep && cd OSCP-Prep/Setup && ./Setup`
> - **Note**: Setup script links `python3/pip3` to `python/pip` commands. Use `python2.7` for normal `python2` commands.

## Install Tools

> - [Modified nmapAutomator](../Scripts/1-Recon/nmapAutomator.sh)
>   - `sudo curl https://raw.githubusercontent.com/Ahaupt3/OSCP-Prep/main/Scripts/1-Recon/nmapAutomator -o /usr/bin/local/nmapAutomator`
> - [Dirsearch](https://github.com/maurosoria/dirsearch)
>   - `git -C ~/Tools clone https://github.com/maurosoria/dirsearch.git`
> - [AutoRecon](https://github.com/Tib3rius/AutoRecon)
>   - `sudo python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git`
> - [Reconnoitre](https://github.com/codingo/Reconnoitre)
>   - `git -C ~/Tools clone https://github.com/codingo/Reconnoitre.git`
>   - `cd Reconnoitre && python3 setup.py install`
> - [ProxyChains4](https://github.com/haad/proxychains)
>   - `sudo apt install -y proxychains4`

## Add to Path

> - Append to RC file:
>
> ```shell
> export PATH=$PATH:$HOME/Tools/dirsearch # dirsearch
> export PATH=$PATH:$HOME/Tools/Reconnoitre # Reconnoitre
> ```

# Reporting

## [Faraday](https://github.com/infobyte/faraday)

### Setup

#### First Use

> 1. Update Faraday: `sudo apt upgrade -y faraday`
> 2. Start PostgreSQL: `sudo systemctl start postgresql`
> 3. Initialize Database: `sudo faraday-manage initdb`
> 4. Start Service: `systemctl start faraday-server`

#### Workspace

> 1. Open Web GUI: **http://localhost:5985**
> 2. Login
> 3. Click **New**:
>    - Workspace Name: **oscp-exam**
>    - Description: **OSCP Exam Workspace**
>    - Start Date: **Current Date**
>    - End Date: **Tomorrow's Date**
>    - Scope: **CIDR/IP Range**
> 4. Click **Save**

## [Faraday-CLI](https://github.com/infobyte/faraday-cli)

### Install

> 1. `git clone git@gitlab.com:faradaysec/faraday-cli.git`
> 2. `cd faraday-cli`
> 3. `pip install .`

### Setup

> 1. Login: `faraday-cli auth`
>    - Faraday URL: **http://localhost:5985**
>    - User: **faraday**
> 2. Add Autocomplete to shell: `echo ". $(pwd)/faraday-cli-autocomplete_zsh.sh" >> $HOME/.zshrc`
> 3. Set Default Workspace: `faraday-cli workspace -a select -n oscp-exam`

### Usage

#### Hosts Info

> - List Hosts: `faraday-cli host`
> - Get Host: `faraday-cli host -a get -hid <host-id>`
> - Create Host: `faraday-cli host -a create -d '[{"ip": "<IP/hostname>", "description": "shortname"}]'`

## [Faraday-Client](https://github.com/infobyte/faraday/wiki/Faraday-Client) (Faraday-CLI GUI)

### Usage

> - Start: `faraday-client`
> - Run command or use **Faraday-Plugin** menu
> - Import XML Reports

## Importing Reports

### File Browser

> - Copy reports to **~/.faraday/report/oscp-exam**
> - If there are problems detecting the plugin to parse the report, append `_faraday_<plugin>` to the filename

### Web GUI

> - In Workspace, click **Manage**
> - Click **Upload a report** icon: <img src="../Assets/Img/Faraday-web-upload.svg" height="25" style="vertical-align:bottom">
> - Click **Select file**
> - Locate & select file in browser
> - Click **Open**

### Faraday-CLI

> - Existing Report: `faraday-cli report "/path/to/report.xml"`
> - From Command: `faraday-cli command "<command>"`

### Faraday-Client

> - Click **Import report** icon: <img src="../Assets/Img/Faraday-client-upload.png" style="vertical-align:bottom">
> - Select plugin from dropdown
> - Click **OK**
> - Locate & select file in browser
> - Click **Open**
>
> **Community Version Note**: Cleanup duplicate vulns manually from imports

## Useful OSCP Plugins for Reporting

> - Dirb
> - Dirsearch
> - DNSenum
> - DNSrecon
> - FTP
> - Hydra
> - Metasploit
> - Netcat
> - Nikto
> - Nmap
> - SSHdefaultscan
> - Telnet

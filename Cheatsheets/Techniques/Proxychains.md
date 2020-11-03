# Proxychains

## Setup

### Install

> 1. `sudo apt install -y proxychains4`

### Configuration

> 1. Edit config file: `sudo vi /etc/proxychains4.conf`
> 2. Add new lines using this format: `<type> <host> <port> <auth>` **auth optional**
>
> - Valid proxy types: **socks4**, **socks5**, **http**, **https**
> - Auth format:
>   - **socks**: `<user> <pass>`
>   - **http/https**: `<basic - user:pass base64 encdoed>`

## Usage

> - **Note**: if proxychains are needed during the exam, you will likely need to target **localhost** for further enumeration (ports, services, etc.)

### General Usage

> - `proxychains4 <command>`

### Nmap Examples

> - `proxychains4 nmap <options> 127.0.0.1`
> - `proxychains4 nmapAutomator 127.0.0.1 <type>`

### Telnet/nc Examples

> - `proxychains4 telnet 127.0.0.1 <port>`
> - `proxychains4 nc -nv 127.0.0.1 <port>`

### SSH Tunnel Example

> - `ssh -fN -D <port> <host>`
> - `PROXYCHAINS_SOCKS5=<port> proxychains <command>`

#### Example

> - `ssh -fN -D 2222 10.10.10.10`
> - `PROXYCHAINS_SOCKS5=2222 proxychains zsh`
>
> This will run a shell with all traffic proxied through SSH tunnel.

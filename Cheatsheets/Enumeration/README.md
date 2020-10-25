# Enumeration

## Ports

### FTP - 21

> - Fingerprint: `nc -nv <ip> 21`
> - Anonymous Access: `ftp <ip>` `ftp> anonymous` `ftp> pass`
> - Commands:
>   - Binary Mode: `binary`
>   - Upload File: `put <file>`
>   - Upload Multiple Files: `mput <file1> <file2>`
>   - Download File: `get <file>`
>   - Download Multiple Files: `mget <file1> <file2>` `mget *`
> - Nmap Scripts: `nmap --script=ftp-anon,ftp-bounce,ftp-libopie,ftp-proftpd-backdoor,ftp-vsftpd-backdoor,ftp-vuln-cve2010-4221 -p 21 <ip>`
> - Config Files:
>   - ftpusers
>   - ftp.conf
>   - proftpd.conf

### SSH - 22

> - Fingerprint: `nc -nv <ip> 22`
> - Config Files:
>   - ssh_config
>   - sshd_config
>   - authorized_keys
>   - ssh_known_hosts
>   - .shosts

### Telent - 23

> - Fingerprint: `telnet <ip>`

### SMTP - 25

> - Fingerprint: `nc -nv <ip> 25`
> - Commands:
>   - Username Exists: `VRFY <username>`
>   - Username Valid: `EXPN <username>`
> - Nmap Scripts: `nmap --script=smtp-commands,smtp-enum-users,smtp-vuln-cve2010-4344,smtp-vuln-cve2011-1720,smtp-vuln-cve2011-1764 -p 25 <ip>`
> - User Bruteforce: `smtp-user-enum -M VRFY -U /root/sectools/SecLists/Usernames/Names/names.txt -t <ip>`
> - Config Files:
>   - sendmail.cf
>   - submit.cf

### DNS - 53

> - Fingerprint: `nc -nv <ip> 53`
> - Get Records (ns, mx, txt, cname): `host -t <record> <ip>` `nslookup <ip>` `dig axfr <domain> @<ip>`
>   - Add domains found to host file (/etc/host)
> - Config Files:
>   - host
>   - resolv.conf

### TFTP - 69

> - Fingerprint: `nc -nv <ip> 69`
> - Commands:
>   - Binary Mode: `binary`
>   - Upload File: `put <file>`
>   - Upload Multiple Files: `put <file1> <file2>`
>   - Download File: `get <file>`
>   - Download Multiple Files: `get <file1> <file2>` `get *`
> - Nmap Scripts: `nmap --script=tftp-enum.nse -p 69 <ip>`
> - Run Command: `winexe -U <username> //<ip> "cmd.exe /c <command>" --system`

### Finger - 79

> - Fingerprint: `nc -nv <ip> 79`

### Kerbors - 88

> Nmap Scripts: `nmap --script=krb5-enum-users --script-args="krb5-enum-users.realm='<domain>'" -p 88 <ip>`

### HTTP/HTTPS - 80/443

> - Fingerprint: `nc -nv <ip> 80/443`
> - Directories:
>   - `nikto -host http(s)://<ip>:<port> (-ssl)`
>   - `dirsearch -w /usr/share/wordlists/dirb/common.txt -t 30 --full-url -e <extensions> -u http(s)://<ip>:<port>`
> - SSL:
>   - Cert Info (get usernames/vhosts): `sslscan <ip>`
>   - Heartbleed: `nmap --script=ssl-heartbleed -p 443 <ip>`
> - Check Input Validation (injection vectors):
>   - SQL: `' or 1=1 #`
>   - XSS: `<script>alert(‘XSS’)</script>`
>   - Path Traversal: `http://<url>/../..`
>   - Format String: `%n` `%x` `%s`
>   - Command Execution: `pwd` may need to escape first (‘ & ! ¦ < >)
>   - Errors: `NULL`
> - Check Page Source: hidden values, dev comments, data leakage, passwords, etc.
> - Config Files: depends on server type, use info from fingerprint to research
> - Log Files: depends on server type, use info from fingerprint to research

### POP3 - 110

> - Fingerprint: `nc -nv <ip> 110`
> - Commands:
>   - Login: `USER <username>` `PASS <password>`
>   - List Emails: `list`
>   - View Email: `retr <id>`

### rpcbind - 111

> - Get Info:
>   - `rpcinfo -p <ip>`
>   - `rpcclient -U "" <ip>`
>     - `srvinfo`
>     - `enumdomusers`
>     - `enumdomgroups`
>     - `getdompwinfo`
>     - `querydominfo`
>     - `netshareenum`
>     - `netshareenumall`

### MSRPC - 135

> - Nmap Scripts: `nmap --script=msrpc-enum -p 135 <ip>`

### SMB - 139/445

> - Fingerprint: `nc -nv <ip> 139/445`
> - List Shares: `smbclient -L \\\\<ip>`
> - Get Shares: `smbclient \\\\<ip>\\\\<share>` `rpcclient -U " " 10.11.1.111`
> - Null Sessions: `smbclient //<ip>/IPC$ -N` `rpcclient -U "" -N <ip>` (see **rpcbind** above for available commands)
> - Nmap Scripts:`nmap --script smb-enum-*,smb-vuln-*,smb-ls.nse,smb-mbenum.nse,smb-os-discovery.nse,smb-print-text.nse,smb-psexec.nse,smb-security-mode.nse,smb-server-stats.nse,smb-system-info.nse,smb-protocols -p 139,445 <ip>`
> - SID Lookup: Impacket - `lookupsid.py <username>:<password>@<ip>`
> - WinRM: `evil-winrm -i <ip> -u <username> -p <password>`

### SNMP - 161/162

> - Get Info: `snmp-check <ip> -c <public|private|community>`
> - Nmap Scripts: `nmap --script=snmp-netstat,snmp-processes -p 161,162 <ip>`

### LDAP - 389/636

> - `ldapsearch -h <ip> -p 389 -x -b "dc=<domain>,dc=<tld>"`
> - `ldapsearch -x -h <ip> -D '<DOMAIN>\<username>' -w '<password-hash>'`
> - `ldapdomaindump <ip> -u '<DOMAIN>\<username>' -p '<password-hash>'`

### MSSQL - 1433

> - Nmap Scripts: `nmap --script=ms-sql-info.nse -p 1433 <ip>`
> - Admin Login: `sqsh -S <ip> -U sa`

## NFS - 2049

> - List Mounts: `showmount -e <ip>`
> - Mount Filesystem: `mount <ip>:/ /<localdir>`

## MySQL - 3306

> - Nmap Scripts: `nmap --script=mysql-databases.nse,mysql-empty-password.nse,mysql-enum.nse,mysql-info.nse,mysql-variables.nse,mysql-vuln-cve2012-2122.nse -p 3306 <ip>`
> - Admin Login: `mysql --host=<ip> -u root -p`

## RDP - 3389

> - Nmap scripts: `nmap --script=rdp-vuln-ms12-020.nse -p 3389 <ip>`
> - Connect: `rdesktop -u <username> -p <password> <ip>`

### VNC - 5900

> - Nmap Scripts: `nmap --script=vnc-info,vnc-brute,vnc-title -p 5900 <ip>`

### WinRM - 5985

> - Connect:
>   - Password: `evil-winrm -i <ip> -u <username> -p <password>`
>   - Hash: `evil-winrm -i <ip> -u <username> -H <hash>`

## OS

### Linux

> - Placeholder

### Windows

> - Placeholder

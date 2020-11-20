# Enumeration

## Ports

### FTP - 21

> https://book.hacktricks.xyz/pentesting/pentesting-ftp
>
> - Fingerprint: `nc -nv <ip> 21`
> - Anonymous Access: `ftp <ip>` `ftp> anonymous` `ftp> pass`
> - Browser Access: `ftp://anonymous:anonymous@10.10.10.98`
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

> https://book.hacktricks.xyz/pentesting/pentesting-ssh
>
> - Fingerprint: `nc -nv <ip> 22`
> - Public SSH key scan: `ssh-keyscan -t rsa <IP> -p 22`
> - Known bad keys: [rapid7/ssh-badkeys](https://github.com/rapid7/ssh-badkeys/tree/master/authorized)
> - Config Files:
>   - ssh_config
>   - sshd_config
>   - authorized_keys
>   - ssh_known_hosts
>   - .shosts

### Telent - 23

> https://book.hacktricks.xyz/pentesting/pentesting-telnet
>
> - Fingerprint: `telnet <ip>`

### SMTP - 25/465/587

> https://book.hacktricks.xyz/pentesting/pentesting-smtp
>
> - Fingerprint: `nc -nv <ip> 25`
> - Commands:
>   - Username Exists: `VRFY <username>`
>   - Username Valid: `EXPN <username>`
> - Nmap Scripts: `nmap --script=smtp-commands,smtp-enum-users,smtp-vuln-cve2010-4344,smtp-vuln-cve2011-1720,smtp-vuln-cve2011-1764 -p 25 <ip>`
> - User Bruteforce: `smtp-user-enum -M VRFY -U /usr/share/seclists/Usernames/Names/names.txt -t <ip>`
> - Config Files:
>   - sendmail.cf
>   - submit.cf

### WHOIS - 43

> https://book.hacktricks.xyz/pentesting/43-pentesting-whois

### DNS - 53

> https://book.hacktricks.xyz/pentesting/pentesting-dns
>
> - Fingerprint: `nc -nv <ip> 53`
> - Get Records (ns, mx, txt, cname): `host -t <record> <ip>` `nslookup <ip>` `dig axfr <domain> @<ip>`
>   - Add domains found to host file (/etc/host)
> - Config Files:
>   - host
>   - resolv.conf

### TFTP - 69 (UDP)

> https://book.hacktricks.xyz/pentesting/69-udp-tftp
>
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

> https://book.hacktricks.xyz/pentesting/pentesting-finger
>
> - Fingerprint: `nc -nv <ip> 79`

### Kerbors - 88

> Nmap Scripts: `nmap --script=krb5-enum-users --script-args="krb5-enum-users.realm='<domain>'" -p 88 <ip>`

### HTTP/HTTPS - 80/443

> https://book.hacktricks.xyz/pentesting/pentesting-web
>
> - Fingerprint: `nc -nv <ip> 80/443`
> - Directories:
>   - `nikto -host http(s)://<ip>:<port> (-ssl)`
>   - `dirsearch -w /path/to/wordlist -t 30 --full-url -e <extensions> -u http(s)://<ip>:<port>`
>   - `ffuf -w /path/to/wordlist -e <extensions> -u <target>/FUZZ`
> - Subdomains/Vhosts:
>   - Subdomains: `curl -s -H "Host: nonexistent.<target>" http://<target> | wc -c` & `ffuf -w /path/to/subdomain/wordlist -u https://<target> -H "Host: FUZZ" -fs <previous output>`
>   - Vhosts: `curl -s -H "Host: nonexistent.<target>" http://<target> | wc -c` & `ffuf -w /path/to/vhost/wordlist -u https://<target> -H "Host: FUZZ.<target>" -fs <previous output>`
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

### Kerberos - 88

> https://book.hacktricks.xyz/pentesting/pentesting-kerberos-88 > https://book.hacktricks.xyz/windows/active-directory-methodology/kerberos-authentication

### POP3 - 110/995

> https://book.hacktricks.xyz/pentesting/pentesting-pop
>
> - Fingerprint: `nc -nv <ip> 110`
> - Commands:
>   - Login: `USER <username>` `PASS <password>`
>   - List Emails: `list`
>   - View Email: `retr <id>`

### rpcbind - 111

> https://book.hacktricks.xyz/pentesting/pentesting-rpcbind
>
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

### Ident - 113

> https://book.hacktricks.xyz/pentesting/113-pentesting-ident

### NTP - 123

> https://book.hacktricks.xyz/pentesting/pentesting-ntp

### MSRPC - 135/594

> https://book.hacktricks.xyz/pentesting/135-pentesting-msrpc
>
> - Nmap Scripts: `nmap --script=msrpc-enum -p 135 <ip>`

### NetBios - 137/138/139

> https://book.hacktricks.xyz/pentesting/137-138-139-pentesting-netbios

### SMB - 139/445

> https://book.hacktricks.xyz/pentesting/pentesting-smb  
> https://www.willhackforsushi.com/sec504/SMB-Access-from-Linux.pdf  
> https://tldp.org/HOWTO/SMB-HOWTO-8.html
>
> - Fingerprint: `nc -nv <ip> 139/445`
> - List Shares: `smbclient -L \\\\<ip>`
> - Get Shares: `smbclient \\\\<ip>\\\\<share>` `rpcclient -U " " 10.11.1.111`
> - Null Sessions: `smbclient //<ip>/IPC$ -N` `rpcclient -U "" -N <ip>` (see **rpcbind** above for available commands)
> - Nmap Scripts:`nmap --script smb-enum-*,smb-vuln-*,smb-ls.nse,smb-mbenum.nse,smb-os-discovery.nse,smb-print-text.nse,smb-psexec.nse,smb-security-mode.nse,smb-server-stats.nse,smb-system-info.nse,smb-protocols -p 139,445 <ip>`
> - SID Lookup: Impacket - `lookupsid.py <username>:<password>@<ip>`
> - WinRM: `evil-winrm -i <ip> -u <username> -p <password>`

### SMTP - 143/993

> https://book.hacktricks.xyz/pentesting/pentesting-imap

### SNMP - 161/162/10161/10162 (UDP)

> https://book.hacktricks.xyz/pentesting/pentesting-snmp
>
> - Get Info: `snmp-check <ip> -c <public|private|community>`
> - Nmap Scripts: `nmap --script=snmp-netstat,snmp-processes -p 161,162 <ip>`

### IRC - 194/6660-7000

> https://book.hacktricks.xyz/pentesting/pentesting-irc

### CheckPoint Firewall-1 - 264

> https://book.hacktricks.xyz/pentesting/pentesting-264-check-point-firewall-1

### LDAP - 389/636/3268/3269

> https://book.hacktricks.xyz/pentesting/pentesting-ldap
>
> - `ldapsearch -h <ip> -p 389 -x -b "dc=<domain>,dc=<tld>"`
> - `ldapsearch -x -h <ip> -D '<DOMAIN>\<username>' -w '<password-hash>'`
> - `ldapdomaindump <ip> -u '<DOMAIN>\<username>' -p '<password-hash>'`

### IPsec/IKE VPN - 500 (UDP)

> https://book.hacktricks.xyz/pentesting/ipsec-ike-vpn-pentesting

### Modbus - 502

> https://book.hacktricks.xyz/pentesting/pentesting-modbus

### Rexec - 512

> https://book.hacktricks.xyz/pentesting/512-pentesting-rexec

### Rlogin - 513

> https://book.hacktricks.xyz/pentesting/pentesting-rlogin

### Rsh - 514

> https://book.hacktricks.xyz/pentesting/pentesting-rsh

### LPD - 515

> https://book.hacktricks.xyz/pentesting/515-pentesting-line-printer-daemon-lpd

### RTSP - 554/8554

> https://book.hacktricks.xyz/pentesting/554-8554-pentesting-rtsp

### Rsync - 873

> https://book.hacktricks.xyz/pentesting/873-pentesting-rsync

### Rusersd - 1026

> https://book.hacktricks.xyz/pentesting/1026-pentesting-rusersd

### Java RMI - 1089/1099

> https://book.hacktricks.xyz/pentesting/1099-pentesting-java-rmi

### MSSQL - 1433

> https://book.hacktricks.xyz/pentesting/pentesting-mssql-microsoft-sql-server
>
> - Nmap Scripts: `nmap --script=ms-sql-info.nse -p 1433 <ip>`
> - Admin Login: `sqsh -S <ip> -U sa`

### Oracle TNS Listener - 1521-1529

> https://book.hacktricks.xyz/pentesting/1521-1522-1529-pentesting-oracle-listener

### NFS - 2049

> https://book.hacktricks.xyz/pentesting/nfs-service-pentesting
>
> - List Mounts: `showmount -e <ip>`
> - Mount Filesystem: `mount <ip>:/ /<localdir>`

### ISCSI - 3260

> https://book.hacktricks.xyz/pentesting/3260-pentesting-iscsi

### SAPRouter - 3299

> https://book.hacktricks.xyz/pentesting/3299-pentesting-saprouter

### MySQL - 3306

> https://book.hacktricks.xyz/pentesting/pentesting-mysql
>
> - Nmap Scripts: `nmap --script=mysql-databases.nse,mysql-empty-password.nse,mysql-enum.nse,mysql-info.nse,mysql-variables.nse,mysql-vuln-cve2012-2122.nse -p 3306 <ip>`
> - Admin Login: `mysql --host=<ip> -u root -p`

### RDP - 3389

> https://book.hacktricks.xyz/pentesting/pentesting-rdp
>
> - Nmap scripts: `nmap --script=rdp-vuln-ms12-020.nse -p 3389 <ip>`
> - Connect: `rdesktop -u <username> -p <password> <ip>`

### epmd - 4369

> https://book.hacktricks.xyz/pentesting/4369-pentesting-erlang-port-mapper-daemon-epmd

### mDNS - 5535 (UDP)

> https://book.hacktricks.xyz/pentesting/5353-udp-multicast-dns-mdns

### PostgreSQL - 5432/5433

> https://book.hacktricks.xyz/pentesting/pentesting-postgresql

### AMQP - 5671/5672

> https://book.hacktricks.xyz/pentesting/5671-5672-pentesting-amqp

### VNC - 5800/5801/5900/5901

> https://book.hacktricks.xyz/pentesting/pentesting-vnc
>
> - Nmap Scripts: `nmap --script=vnc-info,vnc-brute,vnc-title -p 5900 <ip>`

### CouchDB - 5984/6984

> https://book.hacktricks.xyz/pentesting/5984-pentesting-couchdb

### WinRM - 5985

> https://book.hacktricks.xyz/pentesting/5985-5986-pentesting-winrm
>
> - Connect:
>   - Password: `evil-winrm -i <ip> -u <username> -p <password>`
>   - Hash: `evil-winrm -i <ip> -u <username> -H <hash>`

### X11 - 6000

> https://book.hacktricks.xyz/pentesting/6000-pentesting-x11

### Redis - 6379

> https://book.hacktricks.xyz/pentesting/6379-pentesting-redis

### AJP - 8009

> https://book.hacktricks.xyz/pentesting/8009-pentesting-apache-jserv-protocol-ajp

### Splunkd - 8089

> https://book.hacktricks.xyz/pentesting/8089-splunkd

### Cassandra - 9042/9160

> https://book.hacktricks.xyz/pentesting/cassandra

### Elastisearch - 9200

> https://book.hacktricks.xyz/pentesting/9200-pentesting-elasticsearch

### MongoDB - 27017/27018

> https://book.hacktricks.xyz/pentesting/27017-27018-mongodb

### Hadoop - 50030/50060/50075/50090

> https://book.hacktricks.xyz/pentesting/50030-50060-50070-50075-50090-pentesting-hadoop

## Tools Cheatsheet

> - [Cheatsheet](https://compass-security.com/fileadmin/Research/White_Papers/2019-01_hacking-tools-cheat-sheet.pdf)

## OS

### Linux

> - [Checklist](https://book.hacktricks.xyz/linux-unix/linux-privilege-escalation-checklist)
> - [Methods](https://book.hacktricks.xyz/linux-unix/privilege-escalation)
> - [ENV Variables](https://book.hacktricks.xyz/linux-unix/linux-environment-variables)

### Windows

> - [Checklist](https://book.hacktricks.xyz/windows/checklist-windows-privilege-escalation)
> - [Methods](https://book.hacktricks.xyz/windows/windows-local-privilege-escalation)
> - [AD](https://book.hacktricks.xyz/windows/active-directory-methodology)
> - [NTLM](https://book.hacktricks.xyz/windows/ntlm)
> - [Creds](https://book.hacktricks.xyz/windows/stealing-credentials)
> - [Auth](https://book.hacktricks.xyz/windows/authentication-credentials-uac-and-efs)
> - [CMD](https://book.hacktricks.xyz/windows/basic-cmd-for-pentesters)
> - [PowerShell](https://book.hacktricks.xyz/windows/basic-powershell-for-pentesters)
> - [AV bypass](https://book.hacktricks.xyz/windows/av-bypass)

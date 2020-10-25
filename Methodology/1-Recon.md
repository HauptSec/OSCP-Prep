# Recon Methodology

> - Create an exam directory for results & run all scans below within that directory.
> - Update with exam IPs & run the [kickoff-scans](../Scripts/1-Recon/kickoff-scans.sh) script to automate the scans below.

## Scanning

> - [nmapAutomator](../Scripts/nmapAutomator.sh)
>   - `nmapAutomator <ip> All`
> - [AutoRecon](https://github.com/Tib3rius/AutoRecon)
>   - `autorecon <ip> --only-scans-dir`
> - [Reconnoitre](https://github.com/codingo/Reconnoitre)
>   - `reconnoitre -t <ip> --dns --snmp --services --hostnames --virtualhosts`

## Web

> - Nikto (included in nmapAutomator script)
> - Dirsearch (included in nmapAutomator script)

## Services

> FTP, SSH, SMB, etc - see the [Enumeration Cheatsheet](../Cheatsheets/Enumeration/README.md) for specific commands.
>
> - Check for anonymous access

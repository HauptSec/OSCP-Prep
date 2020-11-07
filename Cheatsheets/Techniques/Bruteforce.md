# Brute Force

## Hash-Identifier

> `hash-identifier <hash>`

## Hashcat

> ### Arguments
>
> |  Argument   | Usage |                                                       Options                                                       |
> | :---------: | :---: | :-----------------------------------------------------------------------------------------------------------------: |
> | Attack Mode |  -a   |                                               0 (dict), 6 (dict+mask)                                               |
> |  Hash Type  |  -m   | See [BHIS Cheat Sheet](https://www.blackhillsinfosec.com/wp-content/uploads/2020/09/HashcatCheatSheet.v2018.1b.pdf) |
>
> ### Example Usage:
>
> - Dict: `hashcat -a 0 -m <#> <hashfile> <wordlist>`
> - Dict+Mask: `hashcat -a 6 -m <#> <hashfile> <wordlist> <mask-pattern>`
>   - Example: `hashcat -a 6 example.dict ?d?d?d?d`
>   - Output: `password0000, password0001, password0002`

## John the Ripper

> ### Arguments
>
> |     Argument      |   Usage   |                          Options                          |
> | :---------------: | :-------: | :-------------------------------------------------------: |
> |    Hash Format    | --format= |                         hash type                         |
> | Wordlist Mangling |  --rules  | See [Docs](https://www.openwall.com/john/doc/RULES.shtml) |
>
> ### Example Usage
>
> - Dict: `john -w=<wordlist> -ru <rules> <hoshfile>`
> - Convert hashfile to John format: `/usr/share/john/<hash-type>2john.py <hashfile>`
> - Example: `/usr/share/john/pem2john.py <pem-hashfile>`
>
> ### GUI
>
> Johnny (preinstalled on Kali)

## Hydra

> ### Arguments
>
> |    Argument     |     Usage      |        Options        |
> | :-------------: | :------------: | :-------------------: |
> |    User/List    |     -l/-L      |       user/file       |
> |    Pass/List    |     -p/-P      |       pass/file       |
> | User:Pass List  |       -C       |         file          |
> |  Ouput Results  |       -o       |         file          |
> | Tasks (threads) |       -t       | # of concurrent tasks |
> |      Port       |       -s       |  non-standard ports   |
> |     HTTP/S      | http-post-form |      see example      |
> |       SSH       |     ssh://     |      see example      |
> |       FTP       |     ftp://     |      see example      |
>
> Additional protocols are available as well
>
> ### Example Usage
>
> - HTTP/S: `hydra -l <user> -P <wordlist> <IP> http-post-form "<uri>:<user-field>=^USER^&<pass-field>=^PASS^&<submit-field>=Login:<error-response"`
>   - Example: `hydra -l admin -P example.dict 10.10.10.10 http-post-form "/login.php:username=^USER^&password=^PASS^&Submit=Login:Incorrect Password"`
> - SSH: `hydra -l <user> -P <wordlist> <IP> ssh`
> - FTP: `hydra -l <user> -P <wordlist> <IP> ftp`
>
> ### GUI
>
> Hydra-GTK (preinstalled on Kali)

# Precompiled Wordlists

> - Seclists (preinstalled on Kali)
> - RockYou (preinstalled on Kali)
> - [Awesome Wordlists](https://github.com/gmelodie/awesome-wordlists)
> - [OneWordlistToListThemAll](https://github.com/mamatb/OneWordlistToListThemAll)

# Generating Wordlists

> ## Cewl
>
> ### Arguments
>
> |      Argument      | Usage |                        Options                         |
> | :----------------: | :---: | :----------------------------------------------------: |
> |   Write to File    |  -w   |                        filename                        |
> |  Depth to Spider   |  -d   |                       # of depth                       |
> | Minumum Wordlength |  -m   |                      # of length                       |
> |  Spider Metadata   |  -a   |                        filename                        |
> |   Spider Emails    |  -e   |                        filename                        |
> |      Use Auth      |       | See [Docs](https://digi.ninja/projects/cewl.php#usage) |
>
> ### Example Usage
>
> - Spider Site: `cewl -w <file> <url>`
> - Spider Metadata: `cewl -m -w <file> <url>`
> - Spider Emails: `cewl -e <file> <url>`
>
> ## Additional Tools
>
> - [John the Ripper](https://netsec.ws/?p=457)
> - [Wordlister](https://github.com/4n4nk3/Wordlister)
> - [CUPP](https://github.com/Mebus/cupp)
> - [Bopscrk](https://github.com/r3nt0n/bopscrk)

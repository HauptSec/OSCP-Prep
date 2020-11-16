# Revese Shell Tricks

## Rlwrap

> Use with netcat to allow command line history & line editing.
>
> - Install: `sudo apt install -y rlwrap`
> - Usage: `rlwrap nc -nvlp <port>`

## Upgrade Shell

> ### Spawn TTY with Python:
>
> - Python2: `python -c 'import pty; pty.spawn("/bin/sh")'`
> - Python3: `python3 -c 'import pty; pty.spawn("/bin/sh")'`
>
> ### Clear the Screen
>
> - `export TERM=xterm-256color`
>
> ### Tab Completion with STTY
>
> - Background Shell: `ctrl + z`
> - ZSH: `stty raw -echo; fg <enter><enter>`
> - Bash: `stty raw -echo` & `fg <enter><enter>`
>
> ### Add Command History
>
> `export SHELL=bash`

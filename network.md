# Network tool and commands

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

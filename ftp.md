# FTP notes

* Start a FTP session
```cmd
ftp 192.168.1.1
```

* If we started `ftp` with no parameter and we want to connect to a `ftp` server, we can use `open`
```cmd
ftp> open IP 21
```

* If we want to transfer file, we should use `bin`, which sets the transfer mode to binary
```cmd
ftp> bin
```

* Quit FTP service with `bye`
```
ftp> bye
```

* Downloading a file from FTP server using `mget` to client's root directory
```bash
ftp> mget FILE.txt
mget FILE.txt? yes
```

* Uploading a file to server using `put` from client's root directory
```bash
ftp> put FILE.txt
```

* Deleting a file on server
```bash
ftp> delete FILE.txt
```

* Switch to `passive` mode to run commands
```bash
ftp> passive
```


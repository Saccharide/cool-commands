# FTP notes

* Start a FTP session
```bash
ftp 192.168.1.1
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

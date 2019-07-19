# Windows

* Display alternate data stream
```
dir /r
```

* Shutdown immediately
```
shutdown /p
```

# Linux Subsystem

* Change the password of a user
```bash
ubuntu config --default-user root
bash
passwd (set the password for root)
passwd $USER
ubuntu config --default-user $USER
```

* Link `pdflatex` or `biblatex` in windows directory
```bash
function pdflatex(){
    /mnt/c/texlive/2017/bin/win32/pdflatex.exe $1
```

* Using `start` by inserting it in bashrc
```bash
function start(){
    /mnt/c/Windows/System32/cmd.exe /c start $1
}
```

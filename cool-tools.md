# OCR
* Tesseract OCR, simple command line OCR tool
```bash
tesseract INPUT.png OUTPUT_FILE
```
# PDF to Image Conversion
* Convert PDFs to ppms
```bash
pdftoppm main.pdf outputname -png
```

* Convert PNG to PDF
```bash
convert *.png output.pdf
```

# PDF to text
```bash
pdftotext INPUT OUTPUT
```

# John-the-ripper
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

# Port scanning 

* `nmap` tells us exactly which version of services are running on the target server
```bash
nmap -A 192.168.1.1
```

# Showmount
* `showmount` is used to see which part of the server are mountable to the outside world
```bash
showmount -e 192.168.1.1
```

# Figlet!

* Centering with `-c`
```bash
figlet -c test
```

* Specifying font with `-f`
```bash
figlet -f script/shadow/slant
```

# BZCAT
* `bzcat` allow you to see the content of a bz zipped file without the need to uncompress it
```bash
bzcat file.bz2
```


# Bettercap
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


# apktool
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

# adb
* Install an app
```bash
adb install APP.apk
```

* Use logcat to see log message of a particular app
```bash
adb logcat | grep -F "`adb shell ps | grep APP_NAME  | tr -s [:space:] ' ' | cut -d' ' -f2`""`'`"
```


# screen
* Use `^A to start screen commands`, `^A ?` for help
```bash
^A ?    help
^A S    split
^A |    vertical split
^A tab  switch screen
^A d    detach
^A k    kill
^A Q    only that screen
^A C    Create a new screen
```

# pdfunite
* Combine or concatenate PDFs! cool!
```bash
pdfunite 1.pdf 2.pdf out.pdf
```

# zsteg
* User `zsteg` to extract Zlib Compression
```bash
zsteg a.png
```

# dirsearch
* Command line dirbuster!!! Awesome
```bash
python3 dirsearch -u URL -E
```

# httpie
* I did not think that there exist such tool that make http request looks so simple and pretty!
```bash
http GET URL // Default to GET, can use http URL
http POST URL hello=world // or http URL hello=world
```

# jq
* A command line JSON processor! can combine with `http`
```bash
jq .dependencies package.json
http URL | jq .dependencies
```

# script
* Awesome tool for recording terminal session!!! Opens a new session for recording, need to exit to save. File saved as `typescript`
```bash
script
```

# Maximum efficiency grep! 
* MAX EFFICENT GREP USAGE HERE! Use `ls` to generate a list of directory which is then passed into `xargs` , `-P 0` means maximum concurrent threads, and then suppresses error message to `/dev/null`
```bash
ls | xargs -P 0 -I folder grep -ri flag folder 2> /dev/null | grep flag{.*}
```

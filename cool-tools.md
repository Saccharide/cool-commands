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

* Convert pngs to pdf
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


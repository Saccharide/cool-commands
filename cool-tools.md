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

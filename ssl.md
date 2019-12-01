# Generate a Self-signed certificate using `openssl`
* Generate a self signed x509 ssl certificate with rsa
```bash
openssl req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 3650 \
            -nodes \
            -out example.crt \
            -keyout example.key
```
* One liner
```
openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out server.crt -keyout server.key
```

* Verify a ssl certificate
```bash
openssl verify cert.pem
```

* Find the issuer of x509 certificate
```bash
openssl x509 -in cert.pem -noout -issuer
```

* Verifys a ssl certifate with a root ca
```bash
openssl verify -CAfile ca-root.pem cert.pem
```

* Convert PEM to CRT format
```bash
openssl x509 -outform der -in your-cert.pem -out your-cert.crt
```

### Adding self signed certificate to the list of root ca
* Must be in crt format
```bash
sudo cp YOUR_CERT.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates
```

* Restarting Apache2 server
```bash
sudo systemctl restart apache2
```

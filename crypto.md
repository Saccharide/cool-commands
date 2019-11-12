# Keywords
* `Fingerprint`, it is a short sequence of bytes used to identify a long piublic key. 
    - They are created by applying a cryptographic hash function to a public key.

# X509 File Extensions

## Encodings

### DER (Distinguished Encoding Rules)
    * `DER` = extension used for `binary` DER encoded certificates. These files may also bear the `CER` or the `CRT` extensions.

### PEM (Privacy-Enhanced Mail)
    * `PEM` = extension used for different types of X509 v3 files which contain ASCII (Base65) data prefixed with a `--------BEGIN PUBLICKEY------` line

## Extensions

### CRT
    * `CRT` is used for certificate.

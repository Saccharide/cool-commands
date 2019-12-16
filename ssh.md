* Generate SSH keys, `-t` type of key, `-b` key length in bits. `-C` for comments
```bash
ssh-keygen -t rsa -b 4096 -C "email@example.com"
```
* Copying your public key Using SSH
```bash
cat ~/.ssh/id_rsa.pub | ssh user@host "mkdir -p ~/.ssh  && cat >>"
```

* Simplify life with `~/.ssh/config`
```bash
Host redstar
    User saccharide
    HostName github.com
	Port 22000
    IdentityFile ~/.ssh/rsa.private
```

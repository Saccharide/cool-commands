* Set git global user name and email
```bash
git config --global user.name saccharide
git config --global user.email $EMAIL
```

* Modify the current commit after comitted (i.e., remove a file being uploaded)
```bash
git commit --amend
```

* Recursive update submodules
```bash
git submodule update --init --recursive
```

* Throw away any uncommitted changes
```bash
git reset --hard HEAD
```

* Print out the log of a git project
```bash
git log
```

* `git` download with SSH (github)
```bash
git clone git@github.com:saccharide/
```

* Replace HTTPS with SSH git push
```bash
git remote set-url origin git@github.com:saccharide/
```



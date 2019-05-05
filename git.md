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

* Stashing: if you want to switch branches, but you don't want to commit what you have been working on. 
```bash
git stash
```

* You can switch between branches and do work elsewhere. To see which stashes stored, you can use
```bash
git stash list
```

* If you have multiple stashes, you can reapply them with `git stash apply`
```bash
git stash apply stash@{2}
```

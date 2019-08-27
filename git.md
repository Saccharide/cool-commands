* Set git global user name and email
```bash
git config --global user.name saccharide
git config --global user.email $EMAIL
git config core.editor
```

* Modify the current commit after committed (i.e., remove a file being uploaded)
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

* See what is changed in the current local copy (pretty convenient way to check difference)
```bash
git diff
```
* Stashing: if you want to switch branches, but you don't want to commit what you have been working on. It also reverts back to HEAD
```bash
git stash
```

* Revert a commit
```bash
git revert
```

* You can switch between branches and do work elsewhere. To see which stashes stored, you can use
```bash
git stash list
```

* If you have multiple stashes, you can reapply them with `git stash apply`
```bash
git stash apply stash@{2}
```
```bash
git stash pop
```

* If you want to un-apply a stashed change
```bash
git stash show -p stash@{0} | git apply -R
```
```bash
git stash show -p | git apply -R
```

* Merge a change
```bash
git mergetool

```
* If just wanted to use ours changes
```bash
git checkout --ours filename.c
```
* If just wanted to use theirs changes
```bash
git checkout --theirs filename.c
```

* If want to discard change on one file and revert back to original after editing
```bash
git checkout -- FILENAME
```


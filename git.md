* Set git global user name and email
```bash
git config --global user.name saccharide
git config --global user.email $EMAIL
git config --global core.editor vim
```

* Modify the current commit message after a commit 
```bash
git commit --amend
```

* Remove files from a commit. Simple and elegant, remove all files after staging them to be pushed
```bash
git reset HEAD
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

* Find out about what new branches in remote
```bash
git fetch
```

* Get a remote branch and track it locally
```bash
git checkout -t origin/BRANCH
```

* Fetch another remote branch
```bash
git fecth
git checkout BRANCH
```

* List all of the remote branch for you
```bash
git branch -v -a
```

* Added a branch to remote
```bash
git push origin BRANCH
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

* See what changes have been made BEFORE `git add`
```bash
git diff FILE
```

* See what changes have been made AFTER `git add`
```bash
git diff --cached FILE
```

* See what changes have been made AFTER `git commit`
```bash
git diff master^^ FILE
```

* Unstage a commit
```bash
git reset --soft HEAD~1
```

* Use `reflog` to look at previous commit not shown by `git log`
```bash
git reflog
git checkout 64875728
```

# Branch and merge workflow
* Creating a branch and update remote, `git checkout -b` is shortcut for `git branch BRANCH` and then `git checkout BRANCH`
```bash
git checkout -b NEW_BRANCH
git push origin NEW_BRANCH
```
* Fetching changes from remote
```bash
git fetch origin
```

* Merging BRANCH with MASTER
```bash
git checkout master
git merge BRANCH
```
* Completely replace one branch with another, ex: replacing master branch with a feature branch, `-s` sets merge strategy, short for `--strategy=<strategy>` , `ours` strategy favors the current branch, and ignoring all changes from all other branches
```bash
git checkout FEATURE
git merge -s ours master
git checkout master
git merge FEATURE
```
* Same as function as before? (need to test this out later)
```bash
git checkout FEATURE
git push -f origin master
```

* Deleteing a branch
```bash
git branch -d BRANCH
git push origin --delete BRANCH
```

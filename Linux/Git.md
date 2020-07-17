## Git remote setup
```
git remote -v
git add set-origin https://github.com/shuklalok/dot-files.git
git remote set origin https://github.com/shuklalok/dot-files.git
git remote set-url origin https://github.com/shuklalok/dot-files.git
git remote add upstream https://github.com/matt13rox/dot-files.git
git remote -v
git fetch --all
```
## Git push changes
```git checkout -b new-branch```
Do some changes.
```
git status
git add .
git commit -m "committing my changes"
git checkout master
git pull upstream master
git rebase upstream/master
git checkout new-branch
git rebase master
git push origin master
git push origin new-branch 
```
## Track a remote branch
```
git clone <origin>
git remote add upstream <upstream>
git fetch --all
git checkout origin/remote-branch (to sneak the changes)
git checkout remote-branch (to track the changes)
```
## Fetch a Pull Request
```
git fetch origin pull/ID/head:BRANCHNAME
```
```ID``` is PR id
```BRANCHNAME``` is new branch you want to create.
Then:
```
git checkout BRANCHNAME
```
## Delete a branch
### Local
```
git branch -d <branch-name>
git branch -D <branch-name>
```
### Remote
```
git push origin --delete <branch-name>
```
## Avoid a new commit
```
git commit --amend (To change the description)
git commit --amend --no-edit (Without changing the description)
```
## Rename a git branch
### Local
```
git checkout <old_name>
git branch -m <new_name>
```
Have already pushed the <old_name> to the remote?
Next steps is to rename the remote branch:
### Remote
```
git push origin -u <new_name>
```
Delete the remote branch:
```
git push origin --delete <old_name>
```
## Restoring lost commits
```git reflog```
If you accidentally reset to an older commit, or rebase wrongly, or any other operation that visually "removes" commits, you can use the reflog to see where you were before and ```git reset --hard``` back to that ref to restore your previous state. ```refs``` are not just the commits but the entire history behind it.

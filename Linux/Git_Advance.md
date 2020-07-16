### ```git push --force-with-lease```
It will not allow you to ```git push -f``` force-push if the remote branch has been updated.
### ```git add -N```
```git commit -a``` ignores newly added files. 
```git add -N``` notify Git about newly added files.
### ```git add -p```
```git add --patch``` causes the ```git add``` command to look at all the new changes.
For each one, asks if you'd like to stage, committ, skip or defer.
```bash
(1/1) Stage this hunk [y,n,q,a,d,e,?]?
```
### ```git checkout -p```
Allows the ```git add``` command to look at all the new changes.
For each one, asks if you'd like to discard. Basically reverting your local working copy to what was there before your change.
```bash
(1/1) Discard this hunk from worktree [y,n,q,a,d,e,?]?
```
### Time-based revision references
```git diff HEAD@{yesterday}```
```git diff HEAD@{'2 months ago'}```
```git diff HEAD@{'2010-01-01 12:00:00'}```
### Clean-up with ```git branch --merged```
To get a list of branches that have been merged into your current branch.
By default it shows for local, for remote use ```git branch -r --merged```.
WARNINIG: It includes the current branch in the output.
### Forgot something in last commit?
- Stage the changes you want incorporated in the previous commit
- use -C to reuse the previous commit message in the HEAD
```$ git commit --amend -C HEAD```
- Or use ```-m``` to make a new message
```$ git commit --amend -m 'I forgot before'```

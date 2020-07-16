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
- ```git diff HEAD@{yesterday}```
- ```git diff HEAD@{'2 months ago'}```
- ```git diff HEAD@{'2010-01-01 12:00:00'}```
### Clean-up with ```git branch --merged```
To get a list of branches that have been merged into your current branch.
By default it shows for local, for remote use ```git branch -r --merged```.
WARNINIG: It includes the current branch in the output.
#### Local Branch Cleanup
- Delete local branches that have been merged into HEAD

```$ git branch --merged | grep -v '\\*\\|master\\|develop' | xargs -n 1 git branch -d```
- Delete local branches that have been merged into origin/master

```$ git branch --merged origin/master | grep -v '\\*\\|master\\|develop' | xargs -n 1 git branch -d```
- Show what local branches haven't been merged to HEAD

```$ git branch --no-merged | grep -v '\\*\\|master\\|develop'```
## Tricks
### Forgot something in last commit?
- Stage the changes you want incorporated in the previous commit
- use -C to reuse the previous commit message in the HEAD
```$ git commit --amend -C HEAD```
- Or use ```-m``` to make a new message
```$ git commit --amend -m 'I forgot before'```
### Did not mean to commit yet?
Undo last commit and bring changes back into staging (i.e. reset to the commit one before HEAD)
```$ git reset --soft HEAD^```
undo last commit and destroy the changes you made (i.e. reset to the commit one before HEAD)
```$ git reset --hard HEAD^```
### Now you think you should have been working in another branch? 
```$ git stash```
Takes staged changes and 'stashes' them for later, and reverts to HEAD.
```$ git stash branch new-branch-name ```
Creates and switches to a new branch, takes the stashed changes and stages them in.
### which commit broke the build?
Made lots of local commits and haven't run any tests?
```bash
$ [unittest runner of choice]
Failures... now unclear where it was broken.
```
```git bisect``` to rescue. 
```bash
$ git bisect start # to initiate a bisect
$ git bisect bad   # to tell bisect that the current rev is the first spot you know was broken.
$ git bisect good <some tag or rev that you knew was working>
$ git bisect run [unittest runner of choice]
Some runs ans git shows you the commit that broke
$ git bisect reset # to exit and put code back to state before git bisect start
Fix code. Run tests. Commit working code. Make the world a better place.
```
### "Ours vs. Theirs"?
```bash
In master
$ git merge a_branch
CONFLICT (content): Merge conflict in conflict.txt
Automatic merge failed; fix conflicts and then commit.
$ git status -s
UU conflict.txt
 
# we know the version of the file from the branch is the version we want.
$ git checkout --theirs conflict.txt
$ git add conflict.txt
$ git commit
 
# Sometimes during a merge you want to take a file from one side wholesale.
# The following aliases expose the ours and theirs commands which let you
# pick a file(s) from the current branch or the merged branch respectively.
#
# N.b. the function is there as hack to get $@ doing
# what you would expect it to as a shell user.
# Add the below to your .gitconfig for easy ours/theirs aliases. 
#    ours   = "!f() { git checkout --ours $@ && git add $@; }; f"
#    theirs = "!f() { git checkout --theirs $@ && git add $@; }; f"
```
### 

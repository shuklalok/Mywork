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
### ```git stash list```
Returns output as below:
```
stash@{2}: WIP #1
stash@{1}: WIP #1
stash@{0}: WIP #1
```
- ```git stash apply stash@{0}``` applies and leaves the the stash. 
- ```git stash pop stash@{0}``` applies and deletes the stash.
- ```git stash drop stash@{0}``` manually deletes the stash.
### ```git archive``` to compress your code
- ```git archive --format zip --output master_branch.zip master```
- ```git archive --format zip --output version_0.1.1.zip "0.1.1"```
### ```git archive``` with ```git stash create``` creates archive with latest (uncommitted) or HEAD
```LATEST=`git stash create`; git archive --format tar -o output.tar ${LATEST:-HEAD}```
### 
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

```$ git branch --merged | grep -v '*\|master\|develop' | xargs -n 1 git branch -d```
- Delete local branches that have been merged into origin/master

```$ git branch --merged origin/master | grep -v '*\|master\|develop' | xargs -n 1 git branch -d```
- Show what local branches haven't been merged to HEAD

```$ git branch --no-merged | grep -v '*\|master\|develop'```
#### Prune tracking branches not on the remote.
```git remote prune origin```
## Tricks
### Forgot something in last commit?
- Stage the changes you want incorporated in the previous commit
- use -C to reuse the previous commit message in the HEAD
```$ git commit --amend -C HEAD```
- Or use ```-m``` to make a new message
```$ git commit --amend -m 'I forgot before'```
#### ... and no edit in commit message is required ...
```$ git commit --amend --no-edit```
### Did not mean to commit yet?
Undo last commit and bring changes back into staging (i.e. reset to the commit one before HEAD)
```$ git reset --soft HEAD^```
undo last commit and destroy the changes you made (i.e. reset to the commit one before HEAD)
```$ git reset --hard HEAD^```
### Now you think you should have been working in another branch? 
```$ git stash; !! branch new-branch-name```

Takes staged changes and 'stashes' them for later, and reverts to HEAD.
Creates and switches to a new branch, takes the stashed changes and stages them in.
### which commit broke the build?
Made lots of local commits and haven't run any tests?
Test someting
Failed...
```bash
$ git bisect start # starts bisect
$ git bisect bad   # Mark one bad.
$ git bisect good <some tag or revision which was working>
$ git bisect run <Test>
```
Some runs and git shows you the commit that broke
```
$ git bisect reset # exit and put code back to state before git bisect start
```
Fix code. Run tests. Commit working code.

### "Ours vs. Theirs"?
In master
```
$ git merge a_branch
```
CONFLICT (content): Merge conflict in conflict.txt

Automatic merge failed; fix conflicts and then commit.
```
$ git status -s
```
UU conflict.txt

We know the version of the file from the branch is the version we want.
```
$ git checkout --theirs conflict.txt
$ git add conflict.txt
$ git commit
```
#### For local or remote repository:
```
git pull -s recursive -X theirs <remoterepo or other repo>
```
#### For default repository:
```
git pull -X theirs
```
#### If already in conflicted state:
all of theirs:
```
git checkout --theirs .
git add .
```
all of ours:
```
git checkout --ours .
git add .
```
### Too many conflicts?
\- | \-
------------ | -------------
Search for all conflicting files | ```grep -lr '<<<<<<<' .```
Accept local/our version | ```git checkout --ours PATH/FILE```
Accept remote/other-branch version | ```git checkout --theirs PATH/FILE```
Multiple files? Accept local/our version | ```grep -lr '<<<<<<<' . \| xargs git checkout --ours```
Multiple files? Accept remote/other-branch version | ```grep -lr '<<<<<<<' . \| xargs git checkout --theirs```

Sometimes during a merge you want to take a file from one side wholesale.
The following aliases expose the ours and theirs commands which let you
pick a file(s) from the current branch or the merged branch respectively.
N.b. the function is there as hack to get $@ doing
what you would expect it to as a shell user.
Add the below to your .gitconfig for easy ours/theirs aliases. 
```bash
#    ours   = "!f() { git checkout --ours $@ && git add $@; }; f"
#    theirs = "!f() { git checkout --theirs $@ && git add $@; }; f"
```
### 

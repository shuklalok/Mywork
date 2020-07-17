## ```git rebase --interactive <branch>```
is known as git squash or squashing. it helps combining multiple commits. 
### Before push
```bash
  8105f93 (HEAD -> master) D 4 file <----------------latest---------|
  bac757a D 3 file                                                  |_____ To be joined
  a113420 D 2 file                                                  |
  17f28fa D 1 file <------------------------------------------------|
  c3b29c2 C file   ------> Note this commit-id                                                 
  51a8ca2 B file
  8dbc7c4 A file
  
  $ git rebase -i <noted_commit_id>
```
Editor will open with following entries:
```bash
  pick 17f28fa D 1 file
  pick a113420 D 2 file
  pick bac757a D 3 file
  pick 8105f93 D 4 file
```
Except the first ```pick``` change all to ```squash``` (or ```s```):
```bash
  pick 17f28fa D 1 file
  s a113420 D 2 file
  s bac757a D 3 file
  s 8105f93 D 4 file
```
Save and Exit, another editor will open to facilitate final commit message.
### After push
Assuming we want to combine 4 commits,
1. Squash commits locally
   ```
   git rebase -i origin/my-branch~4 my-branch
   ```
   and then force push
   ```
   git push origin +my-branch
   ```
   - ```+``` forces only the refspec which is prefixed by it.
   - ```--force``` will force all the refspecs being pushed.
1. In my-branch
   ```
   git reset --soft HEAD~4
   git commit
   git push --force origin my_branch
   ```

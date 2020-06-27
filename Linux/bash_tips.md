## QUICK BACKUP COPY
```
cp test.txt{,.old}
```
## ```sudo``` rerequired
```
$ apt install sl
(13: Permission denied), are you root?
$ sudo !!
```
## User previous arguments
```
$ touch file1 file2 file3 file4
$ chmod 777 !*
chmod 777 file1 file2 file3 file4
```
## Your most favourite command
```
$ history | awk 'BEGIN {FS="[ \t]+|\\|"} {print $3}' | sort | uniq -c | sort -nr | head
```
## autocorrect directory names
```
shopt -s cdspell
```
Only with bash
## Set CDPATH to access dirs
```
$ export CDPATH='~:/etc'
$ cd ansible
/etc/ansible
$ cd Downloads
/home/user/Downloads
```
## Key bindings
bash|zsh
----|----
bind -p| bindkey -l

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
## Use previous arguments
```
$ touch file1 file2 file3 file4
$ chmod 777 !*
chmod 777 file1 file2 file3 file4
```
## Use previous last argument
```
$ echo "Hello"
Hello
$ echo !$
echo "Hello"
Hello
```
## Run command in sequence
```
&& - Run if the previous command is successful
|| - Run if the previous command is failed
;  - Run regardless of the result of previous command 
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

On command prompt:
bindkey| description
-------|------------
ctrl + w| to remove the unwanted arguments
ctrl + \_| to undo the last edit
ctrl + k| to cut from the cursor to the end
ctrl + u| to cut from the cursor to the begning
ctrl + y| to paste whatever cut with ctrl+k/ctrl+u 
ctrl + x + ctrl + e| to edit a big command in editor

## Redirecting I/O
2>&1 - redirect stdout and stderr to a file

# check for open ports
```
echo > /dev/tcp/<server ip>/<port>
`` use back ticks to shell out
```

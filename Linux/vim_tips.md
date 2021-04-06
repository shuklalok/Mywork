### Oh! I wanted to save the changes but forgot to open as ```sudo```
Save using following command in vim:
```bash
:w !sudo tee %
```

:w – Write a file (actually buffer).
!sudo – Call shell with sudo command.
tee – The output of write (vim :w) command redirected using tee.
% – The % is nothing but current file name.

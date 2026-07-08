## Devin Desktop Launcher Issue (WSL)

### Problem 
When trying to launch `devin-desktop` from inside WSL (Windows Subsystem for Linux), the Devin Desktop opens with reference to the WSL mount path like `/mnt/c/Users/...` and default terminal as Powershell.
Users like the behaviour exactly same as Windows and VSCODE remote understand.
Simply running `devin-desktop` doesn't work becasue Windows doesn't know to interpret the WSL specific PATH directly.

### Solution
Create a `devin-desktop-launcher.sh` script to convert the Linux PATH to the correct VSCODE Remote WSL URI format and launch with proper parameters.
```bash
#!/bin/bash
CURRENT_PATH=$(readlink -f "$1")
devin-desktop --folder-uri "vscode-remote://wsl+Ubuntu-24.04$CURRENT_PATH"
```
Make this file executable.
```bash
chmod +x devin-desktop-launcher.sh
```

Add alias in the `.zshrc` file.
```bash
alis devin-d="~/devin-desktop-launcher.sh ."
```

Now run `devin-d .` from any directory in WSL. It will launch with the WSL reference PATH and default shell settings in Devin Desktop.

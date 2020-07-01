Assuming that the WSL, Ubuntu and zsh is already installed.
### Install terminator
```
sudo apt install terminator -y --no-install-recommends
```
### Install VcXsrv
From this [link](https://sourceforge.net/projects/vcxsrv/)
### Create a VB script to launch the terminator
```
args = "~ " & "-c " & "-l " & """DISPLAY=127.0.0.1:0 SHELL=/usr/bin/zsh LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 terminator"""
WScript.CreateObject("Shell.Application").ShellExecute "bash", args, "", "open", 0
```
Save the file with .vbs extension, create a desktop shortcut, change icon.
### A working OneDark with zsh-autosuggestion
```
~ ➤ cat ~/.config/terminator/config                                                                                                    
[global_config]
  dbus = False
[keybindings]
[profiles]
  [[default]]
    background_color = "#282828"
    cursor_color = "#aaaaaa"
    font = Fira Code 10
    foreground_color = "#ebdbb2"
    use_system_font = False
  [[one_dark]]
    background_color = "#1e2127"
    cursor_color = "#676c76"
    font = Fira Code 14
    foreground_color = "#5c6370"
    show_titlebar = False
    palette = "#000000:#e06c75:#98c379:#d19a66:#61afef:#c678dd:#56b6c2:#abb2bf:#5c6370:#e06c75:#98c379:#d19a66:#61afef:#c678dd:#56b6c2:#fffefe"
    use_system_font = False
    copy_on_selection = True
[layouts]
  [[default]]
    [[[window0]]]
      type = Window
      parent = ""
    [[[child1]]]
      type = Terminal
      parent = window0
      profile = one_dark
[plugins]

```
### Workaround for invisible dirnames (dircolors) on pressing tab
Add it in ~/.zshrc file.
```
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit
```

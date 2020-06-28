## ZSH CONFIG
```
sudo apt install zsh git curl neovim fonts-powerline fonts-firacode rofi feh lxappearance i3lock-fancy
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
sed -i '/plugins=(git/s/)$/ zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
sed -i 's/robbyrussell/arrow/' ~/.zshrc
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \\n
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
vim +'PlugInstall --sync' +qa
```
## GIT Pager Problem
- Add ```export LESS=-JMQRiFX``` in ~/.zshrc
- ```source ~/.zshrc```
## VIM - NEOVIM load conflict
```
sudo apt remove vim
sudo apt purge vim
sudo apt install neovim
```
## Font problem
```
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
```
## FZF solution
```
cd .vim/plugged/fzf
ls
./install
source ~/.zshrc
```
## Rg not working
```sudo apt install ripgrep```
## Use ripgrep with fzf
Add:
```
alias rgf="rg --files | fzf"
```
## tags not working
```sudo apt install ctags```
## Auto Capitalization
```
sudo curl \\n -L https://raw.githubusercontent.com/nickjj/title-case-converter/master/tcc \\n -o /usr/local/bin/tcc && sudo chmod +x /usr/local/bin/tcc
```
## VIM plugins loads
```
vim --startuptime timing.out
vim timing.out
rm -rf timing.out
vim --cmd 'profile start vimrc.profile' --cmd 'profile! file ~/.vimrc'
vim timing.out
```
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

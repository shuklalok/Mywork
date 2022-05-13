## ZSH CONFIG
sudo apt install zsh git curl neovim fonts-powerline fonts-firacode rofi feh lxappearance i3lock-fancy
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions


sudo apt remove vim
sudo apt purge vim
sudo apt install neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/shuklalok/dot-files.git ~/dot-files
mkdir -p ~/.config/nvim; cp ~/dot-files/.config/nvim/init.vim ~/.config/nvim/
vim +'PlugInstall --sync' +qa

## Font problem
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
## FZF solution
cd .vim/plugged/fzf
ls
./install

sudo apt install ripgrep
sudo apt install ctags
cp -f ~/dot-files/.zshrc ~/.zshrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
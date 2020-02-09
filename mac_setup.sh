#!/bin/zsh

# brew install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
xargs brew install < my_formula.txt
xargs brew cask install < my_cask_formula.txt

# prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
rm ~/.zpreztorc -y
rm ~/.zshrc -y
ln -s ~/dotfiles/zpreztorc ~/.zpreztorc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

# Python
pyenv install 3.7.5
pyenv install 2.7.16
pyenv global 2.7.16
pyenv rehash
pip install --upgrade pip
pip install pynvim
pyenv global 3.7.5
pyenv rehash
pip install --upgrade pip
pip install -r requirements.txt

# Node
nodebrew setup
nodebrew install-binary stable
nodebrew use stable
npm install -g neovim

# Neovim
brew install --HEAD neovim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm installer.sh
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
# nvimを開いて:call  dein#update()を実行
# 上手くいかなければ:checkhealth

# Fira code
brew tap homebrew/cask-fonts && brew cask install font-fira-code

# SSH
ssh-keygen -y

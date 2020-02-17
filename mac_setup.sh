#!/bin/zsh
printf "password: "
read password

# フォルダ名の英語化
rm */.localized -y

# brew install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew tap
brew tap homebrew/cask-fonts
brew tap mongodb/brew

# requirements.txt的なやつ
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


# SSH
ssh-keygen -y

# latex
echo "$passowrd" | sudo -S tlmgr update --self --all
echo "$passowrd" | sudo -S tlmgr paper a4
echo "$passowrd" | sudo -S tlmgr install collection-langjapanese
echo "$password" | sudo -S tlmgr repository add http://contrib.texlive.info/current tlcontrib
echo "$password" | sudo -S tlmgr pinning add tlcontrib '*'
echo "$password" | sudo -S tlmgr install japanese-otf-nonfree japanese-otf-uptex-nonfree ptex-fontmaps-macos cjk-gs-integrate-macos
echo "$password" | sudo -S cjk-gs-integrate --link-texmf --cleanup
echo "$password" | sudo -S mktexlsr
echo "$password" | sudo -S kanji-config-updmap-sys --jis2004 hiragino-highsierra-pron

#!/bin/zsh
set -e
# brew install tools
brew install gcc wget cmake make openssl readline sqlite3 xz zlib pyenv direnv pipenv nodebrew tmux go mysql postgresql nginx peco fzf ghq zsh-completions zsh-autosuggestions r docker tig libomp
brew install --HEAD neovim
brew cask install docker rstudio tableplus wireshark zotero gimp dropbox appcleaner google-backup-and-sync dash skitch java
brew tap homebrew/cask-fonts && brew cask install font-fira-code

# for english directory name
cd
rm Applications/.localized Desktop/.localized Library/.localized Movies/.localized Music/.localized Pictures/.localized Downloads/.localized Documents/.localized
killall Finder

# zsh setup
cd
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
cp ~/dotfiles/.zshrc ~/.zshrc
cp ~/dotfiles/.zpreztorc ~/.zprezto/runcoms/zpreztorc
cp ~/dotfiles/prompt_sorin_setup ~/.zprezto/modules/prompt/functions/prompt_sorin_setup
cp ~/dotfiles/.tmux.conf ~/.tmux.conf
source ~/.zshrc

# python setup
pyenv install 3.7.5
pyenv global 3.7.5
pyenv rehash
pip install -r ~/dotfiles/requirements.txt
source virutalenvwarpper.sh

# vim setup
mkdir ~/.config
cp -r ~/dotfiles/.config/nvim ~/.config/
ln -s ~/.config/nvim/init.vim ~/.vimrc

mkdir -p ~/.cache/dein
cd ~/.cache/dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein

# node setup
nodebrew setup
nodebrew install-binary stable
nodebrew use stable

# latex setup
brew cask install basictex latexit
brew install ghostscript
sudo tlmgr update --self --all
sudo tlmgr paper a4
sudo tlmgr install collection-langjapanese
sudo tlmgr repository add http://contrib.texlive.info/current tlcontrib
sudo tlmgr pinning add tlcontrib '*'
sudo tlmgr install japanese-otf-nonfree japanese-otf-uptex-nonfree ptex-fontmaps-macos cjk-gs-integrate-macos
sudo cjk-gs-integrate --link-texmf --cleanup
sudo cjk-gs-integrate-macos --link-texmf
sudo mktexlsr
sudo kanji-config-updmap-sys --jis2004 hiragino-highsierra-pron

# ssh
ssh-keygen
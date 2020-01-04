# homebrew install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# for english directory name
rm Applications/.localized Desktop/.localized Library/.localized Movies/.localized Music/.localized Pictures/.localized
killall Finder

# basic install
# virtualbox can't be installed once
brew cask install alfred iterm2 visual-studio-code
brew install openssl readline sqlite3 xz zlib pyenv direnv pipenv nodebrew tmux neovim go mysql posgresql nginx peco fzf ghq zsh-completions zsh-autosuggestions r docker tig
brew cask install docker rstudio vagrant mysqlworkbench db-browser-for-sqlite tableplus wireshark
brew tap homebrew/cask-fonts && brew cask install font-fira-code

# zsh setup
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
cp dotfiles/.zpreztorc .zprezto/runcomes/zpreztorc
ln -s .zpreztorc .zprezto/runcoms/zpreztorc
cp dotfiles/prompt_sorin_setup .zprezto/modules/prompt/functions/prompt_sorin_setup
cp dotfiles/.tmux.conf ~/.tmux.conf

# vim setup
mkdir -p ~/.config/nvim
cp dotfiles/.vimrc ~/.vimrc
cp dotfiles/dein.toml ~/.config/nvim/dein.toml
cp dotfiles/dein_lazy.toml ~/.config/nvim/dein_lazy.toml
ln -s ~/.vimrc ~/.config/nvim/init.vim

# python setup
pyenv install 3.7.5
pyenv global 3.7.5

# node
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

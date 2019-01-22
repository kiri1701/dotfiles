# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# 追加したソフトやパッケージ用のコマンドのパスを通す
export PATH=/usr/local/bin:/Library/TeX/texbin:$PATH
export PATH="$HOME/.pyenv/shims:$PATH"
export PATH="$PATH:/usr/local/bin"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$PATH:/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home
export PGDATA=/usr/local/var/postgres

# envのパスを通す
eval "$(pyenv init -)"
eval "$(rbenv init -)"
eval "$(pyenv virtualenv-init -)"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kiri/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kiri/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/kiri/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kiri/google-cloud-sdk/completion.zsh.inc'; fi


# zsh-completionsの設定
autoload -U compinit && compinit -u
fpath=(/usr/local/share/zsh-completions $fpath)
zstyle ':completion:*' menu select interactive
setopt menu_complete
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
alias g='git'
alias gs='git status'
alias gb='git branch'
alias gc='git checkout'
alias gct='git commit'
alias ga='git add'
alias gd='git diff'
alias gl='git log'
alias gcm='git commit -m'
alias gpom='git push origin master'
alias vim='vim'
alias vi='nvim'
alias r='ruby'
alias mss='mysql.server start'
alias so='source'
alias f='fuck'

# 文字コードの指定
export LANG=ja_JP.UTF-8
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
# cdなしでディレクトリ移動
setopt auto_cd
# ビープ音の停止
setopt no_beep
# ビープ音の停止(補完時)
setopt nolistbeep
# cd -<tab>で以前移動したディレクトリを表示
setopt auto_pushd
# ヒストリ(履歴)を保存、数を増やす
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
# 直前と同じコマンドの場合は履歴に追加しない
setopt hist_ignore_dups
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks


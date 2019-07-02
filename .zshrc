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

# 追加したソフトやパッケージ用のコマンドのパスを通す
export PATH=/usr/local/bin:/Library/TeX/texbin:$PATH
export PATH="$PATH:/usr/local/bin"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$PATH:/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home
export PGDATA=/usr/local/var/postgres
export EDITOR='vim' # nanoからvimに変更
export VISUAL='vim' # nanoからvimに変更
export PATH=/Users/$USER/anaconda3/bin:$PATH

# envのパスを通す
eval "$(rbenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kiri/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kiri/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/kiri/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kiri/google-cloud-sdk/completion.zsh.inc'; fi

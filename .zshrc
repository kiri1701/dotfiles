# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# zsh-complation
fpath=(path/to/zsh-completions/src $fpath)

#peco
function peco-history-selection() {
    BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\*?\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$LBUFFER")
    CURSOR=${#BUFFER}
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

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
alias vim='nvim'
alias vi='vim'
alias pes='pipenv shell'

# 追加したソフトやパッケージ用のコマンドのパスを通す
export PATH="$PATH:/usr/local/bin"
export PATH="/usr/local/bin:/Library/TeX/texbin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export EDITOR='vim' # nanoからvimに変更
export VISUAL='vim' # nanoからvimに変更
export PYENV_ROOT=/usr/local/var/pyenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PGDATA=/usr/local/var/postgres
export PIPENV_VENV_IN_PROJECT=true

# envのパスを通す
## Set path for pyenv
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi


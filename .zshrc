eval "$(/opt/homebrew/bin/brew shellenv)"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# oh-my-zshのセットアップ
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit cdclear -q

# プロンプトのカスタマイズ
setopt promptsubst
zinit snippet OMZT::gnzh
# Load the pure theme, with zsh-async library that's bundled with it.
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

# 補完
zinit light zsh-users/zsh-autosuggestions
# シンタックスハイライト
zinit light zdharma-continuum/fast-syntax-highlighting
# iTerm2を使っている場合に、コマンド `tt タブ名` でタブ名を変更できる
zinit light gimbo/iterm2-tabs.zsh
# Gitの変更状態がわかる ls。ls の代わりにコマンド `k` を実行するだけ。
zinit light supercrabtree/k

# AWS CLI v2の補完。
# 要 AWS CLI v2
# この順序で記述しないと `complete:13: command not found: compdef` のようなエラーになるので注意
# autoload bashcompinit && bashcompinit
# source ~/.zinit/plugins/drgr33n---oh-my-zsh_aws2-plugin/aws2_zsh_completer.sh
# complete -C '/usr/local/bin/aws_completer' aws
# zinit light drgr33n/oh-my-zsh_aws2-plugin

# anyframeのセットアップ
zinit light mollifier/anyframe

# Ctrl+x -> b
# peco でディレクトリの移動履歴を表示
bindkey '^xb' anyframe-widget-cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
# Ctrl+x -> r
# peco でコマンドの実行履歴を表示
bindkey '^xr' anyframe-widget-execute-history
# Ctrl+x -> Ctrl+b
# peco でGitブランチを表示して切替え
bindkey '^x^b' anyframe-widget-checkout-git-branch
# Ctrl+x -> g
# GHQでクローンしたGitリポジトリを表示
bindkey '^xg' anyframe-widget-cd-ghq-repository
bindkey -e

# 追加したソフトやパッケージ用のコマンドのパスを通す
export EDITOR='vim' # nanoからvimに変更
export VISUAL='vim' # nanoからvimに変更
export PATH="$PATH:/usr/local/bin"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:/Library/TeX/texbin:$PATH"
export PGDATA=/usr/local/var/postgres
export PATH="$PATH:/Users/kiri/Development/flutter/bin"
export PATH="$HOME/.poetry/bin:$PATH"
export CARGO_HOME="$HOME/.cargo"
export PATH="$CARGO_HOME/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"


# Customize to your needs...
alias gb='git branch'
alias gc='git checkout'
alias gct='git commit'
alias ga='git add'
alias gd='git diff'
alias gl='git log'
alias gcm='git commit -m'
alias gpom='git push origin main'
alias mem='cat /proc/meminfo'
alias cpu='cat /proc/cpuinfo'
alias vcd='code "`ghq root`/`ghq list | peco`"'
alias gcd='cd $(ghq root)/$(ghq list | peco)'
alias repo='ls $HOME/Repos/|peco'
alias vim='nvim'
alias kc='kubectl'

# anyenvのセット
if [ -e "$HOME/.anyenv" ]
then
    export ANYENV_ROOT="$HOME/.anyenv"
    export PATH="$ANYENV_ROOT/bin:$PATH"
    if command -v anyenv 1>/dev/null 2>&1
    then
        eval "$(anyenv init -)"
    fi
fi

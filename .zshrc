
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk
# Preztoのセットアップ
zinit snippet PZT::modules/helper/init.zsh
# oh-my-zshのセットアップ
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit cdclear -q
# プロンプトのカスタマイズ
setopt promptsubst
zinit snippet OMZT::gnzh
zinit light agnoster/agnoster-zsh-theme # <- ここで好きなテーマのGitHubリポジトリを Group/Repository で指定。

# 補完
zinit light zsh-users/zsh-autosuggestions
# シンタックスハイライト
zinit light zdharma/fast-syntax-highlighting
# Ctrl+r でコマンド履歴を検索
zinit light zdharma/history-search-multi-word
# クローンしたGit作業ディレクトリで、コマンド `git open` を実行するとブラウザでGitHubが開く
zinit light paulirish/git-open
# iTerm2を使っている場合に、コマンド `tt タブ名` でタブ名を変更できる
zinit light gimbo/iterm2-tabs.zsh
# jq をインタラクティブに使える。JSONを標準出力に出すコマンドを入力した状態で `Alt+j` すると jq のクエリが書ける。
zinit light reegnz/jq-zsh-plugin
# Gitの変更状態がわかる ls。ls の代わりにコマンド `k` を実行するだけ。
zinit light supercrabtree/k

# AWS CLI v2の補完。
# 要 AWS CLI v2
# この順序で記述しないと `complete:13: command not found: compdef` のようなエラーになるので注意
autoload bashcompinit && bashcompinit
source ~/.zinit/plugins/drgr33n---oh-my-zsh_aws2-plugin/aws2_zsh_completer.sh
complete -C '/usr/local/bin/aws_completer' aws
zinit light drgr33n/oh-my-zsh_aws2-plugin

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


# Customize to your needs...
alias gb='git branch'
alias gc='git checkout'
alias gct='git commit'
alias ga='git add'
alias gd='git diff'
alias gl='git log'
alias gcm='git commit -m'
alias gpom='git push origin master'
alias mem='cat /proc/meminfo'
alias cpu='cat /proc/cpuinfo'
alias pr='poetry run'
alias pp='poetry run python'
alias ccds='cookiecutter https://github.com/drivendata/cookiecutter-data-science'
alias vcd='code "`ghq root`/`ghq list | peco`"'
alias gcd='cd $(ghq root)/$(ghq list | peco)'
alias repo='ls $HOME/Repos/|peco'
alias vim='nvim'


function pdev () {
  poetry add -D black flake8 mypy pytest
}

# 追加したソフトやパッケージ用のコマンドのパスを通す
export EDITOR='vim' # nanoからvimに変更
export VISUAL='vim' # nanoからvimに変更
export PATH="$PATH:/usr/local/bin"
export PATH="/usr/local/bin:/Library/TeX/texbin:$PATH"
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PYENV_ROOT=/usr/local/var/pyenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PGDATA=/usr/local/var/postgres
export PATH="$PATH:/Users/kiri/flutter/bin"

# envのパスを通す
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi

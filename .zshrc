# 追加したソフトやパッケージ用のコマンドのパスを通す
export PATH=/usr/local/bin:/Library/TeX/texbin:$PATH
export PATH="$HOME/.pyenv/shims:$PATH"
export PATH="$PATH:/usr/local/bin"
# rbenvのパスを通す
eval "$(rbenv init -)"

# zplugを導入するPATH
# export ZPLUG_HOME=/usr/local/opt/zplug
# source $ZPLUG_HOME/init.zsh

# Path to your oh-my-zsh installation.
export ZSH=/Users/kiri/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# oh-my-zshで利用できるテーマを指定

ZSH_THEME="agnoster"
PROMPT='$ '
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# oh my zshで利用できるプラグインを指定
plugins=(brew brew-cask cdd gem git rbenv vagrant zsh-syntax-highlighting zsh-completions)

# zsh-completionsの設定
autoload -U compinit && compinit -u
fpath=(/usr/local/share/zsh-completions $fpath)
source $ZSH/oh-my-zsh.sh
zstyle ':completion:*' menu select interactive
setopt menu_complete

#source ~/alien/alien.zsh
#export ALIEN_THEME="blue"
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias g='git'
alias gs='git status'
alias gb='git branch'
alias gc='git checkout'
alias gct='git commit'
alias gg='git grep'
alias ga='git add'
alias gd='git diff'
alias gl='git log'
alias gcma='git checkout master'
alias gfu='git fetch upstream'
alias gfo='git fetch origin'
alias gmod='git merge origin/develop'
alias gmud='git merge upstream/develop'
alias gmom='git merge origin/master'
alias gcm='git commit -m'
alias gpo='git push origin'
alias gpom='git push origin master'
alias gst='git stash'
alias gsl='git stash list'
alias gsu='git stash -u'
alias gsp='git stash pop'
alias vim='nvim'
alias vi='nvim'
alias nv='nvim'
alias r='ruby'
alias mss='mysql.server start'
alias so='source'
alias be='bundle exec'
alias ber='bundle exec ruby'
alias rs='rails s'
alias rc='rails c'
alias bers='bundle exec rails s'
alias berc='bundle exec rails c'
alias sberc='sudo bundle exec rails c'
alias Kobito='cd ~/Library/Containers/com.qiita.Kobito/Data/Library/Kobito/'
alias f='fuck'
# 文字コードの指定
export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors
colors

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

# キーバインディングをemacs風にする
# bindkey -d
# bindkey -e

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
source ~/.iterm2_shell_integration.zsh
source $HOME/.cargo/env
export RUST_SRC_PATH='/Users/kiri/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'

eval $(thefuck --alias)

zsh_wifi_signal(){
   local signal=$(nmcli device wifi | grep yes | awk '{print $8}')
   local color='%F{yellow}'
   [[ $signal -gt 75 ]] && color='%F{green}'
   [[ $signal -lt 50 ]] && color='%F{red}'
   echo -n "%{$color%}\uf230  $signal%{%f%}" # \uf230 is 
 }

POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context time battery dir vcs virtualenv custom_wifi_signal)

case "$TERM" in
    xterm*|kterm*|rxvt*)
    PROMPT=$(print "%B%{\e[34m%}%m:%(5~,%-2~/.../%2~,%~)%{\e[33m%}%# %b")
    PROMPT=$(print "%{\e]2;%n@%m: %~\7%}$PROMPT") # title bar
    ;;
    *)
    PROMPT='%m:%c%# '
    ;;
esac

function powerline_precmd() {
   PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
  install_powerline_precmd
fi

export PATH=$PATH:/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kiri/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kiri/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kiri/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kiri/google-cloud-sdk/completion.zsh.inc'; fi

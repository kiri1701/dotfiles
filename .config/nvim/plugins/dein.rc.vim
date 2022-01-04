let s:plugin = '~/.config/nvim/plugins/config/dein.toml'
let s:plugin_lazy = '~/.config/nvim/plugins/config/dein_lazy.toml'

if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  if exists('g:vscode')
      " vscodeの場合こちらのプラグインを利用
      call dein#add('asvetliakov/vim-easymotion')
      " sで任意の２文字から始まる場所へジャンプ
      nmap m <Plug>(easymotion-s2)
  else
    call dein#load_toml(s:plugin, {'lazy': 0})
    call dein#load_toml(s:plugin_lazy, {'lazy': 1})
  endif

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

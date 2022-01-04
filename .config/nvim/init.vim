" python path
let g:python3_host_prog = $PYENV_ROOT.'/versions/3.9.9/bin/python'
let g:python_host_prog = $PYENV_ROOT.'/versions/2.7.17/bin/python'

let g:ruby_host_prog = '/Users/kiri/.anyenv/envs/rbenv/shims/neovim-ruby-host'


runtime! plugins/dein.rc.vim
runtime! keymap.vim

" 2バイト文字を許容するかみたいなやつ
if !exists('g:vscode')
    set ambiwidth=double
endif

"文字コードをUFT-8に設定
set fenc=utf-8
" 保存時の文字コード
set fileencoding=utf-8
" 読み込み時の文字コードの自動判別. 左側が優先される
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
" 改行コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" クリップボードとの連携
set clipboard+=unnamed
" マウスを有効に
set mouse=a
" backspaceを有効に
set backspace=indent,eol,start

" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" シンタックスハイライトの有効化
syntax enable
" プログラム言語向けの自動インデント
set smartindent
" 画面スクロールのにいくつ余裕を持たせるか
set scrolloff=5

" Tab系
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch

colorscheme molokai
set t_Co=256

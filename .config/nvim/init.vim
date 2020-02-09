" python path
let g:python3_host_prog = $PYENV_ROOT.'/versions/3.7.5/bin/python'
let g:python_host_prog = $PYENV_ROOT.'/versions/2.7.17/bin/python'

" プラグインの設定ファイルPath
let s:plugin = '~/.config/nvim/plugins/config/dein.toml'

runtime! plugins/dein.rc.vim
runtime! keymap.vim

syntax enable
set number
set cursorline
set autoindent
set expandtab
set smartindent
set nowritebackup

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast
set backspace=indent,eol,start
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set splitright
set splitbelow
set hidden
set hlsearch
set incsearch
set ignorecase
set smartcase
set nobackup
set noswapfile
set fileformats=unix,dos,mac
set ruler
set gcr=a:blinkon0
set scrolloff=3
set laststatus=2
set modeline
set modelines=10
set title
set titleold="Terminal"
set titlestring=%F
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
set autoread
set clipboard+=unnamed
set mouse=a
set whichwrap=b,s,h,l,<,>,[,]
highlight Pmenu ctermbg=233 ctermfg=241
highlight PmenuSel ctermbg=233 ctermfg=166
highlight Search ctermbg=166 ctermfg=233
highlight Visual ctermbg=166 ctermfg=233

let mapleader = "\<Space>"

"" vim-airline
let g:airline_theme = 'wombat'
set laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
let g:airline_section_c = '%t'
let g:airline_section_x = '%{&filetype}'
let g:airline_section_z = '%3l:%2v %{airline#extensions#ale#get_warning()} %{airline#extensions#ale#get_error()}'
let g:airline#extensions#ale#error_symbol = ' '
let g:airline#extensions#ale#warning_symbol = ' '
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

" for vim-anzu
nmap n nzz<Plug>(anzu-update-search-status)
nmap N Nzz<Plug>(anzu-update-search-status)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
nmap <silent> <ESC><ESC> :<C-u>nohlsearch<CR><Plug>(anzu-clear-search-status)

" for opretaor-replace
map R <Plug>(operator-replace)

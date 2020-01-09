" python path
let g:python3_host_prog = $PYENV_ROOT.'/shims/python'
let g:python_host_prog = '/usr/local/bin/python'

" プラグインの設定ファイルPath
let s:plugin = '~/.config/nvim/plugins/config/dein.toml'

runtime! plugins/dein.rc.vim
runtime! keymap.vim
runtime! colorscheme.vim

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


"" nerdtree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
let NERDTreeShowHidden=1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <Leader>ne :NERDTreeTabsToggle<CR>
autocmd BufWritePre * :FixWhitespace

" for vim-anzu
nmap n nzz<Plug>(anzu-update-search-status)
nmap N Nzz<Plug>(anzu-update-search-status)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
nmap <silent> <ESC><ESC> :<C-u>nohlsearch<CR><Plug>(anzu-clear-search-status)

" for opretaor-replace
map R <Plug>(operator-replace)


" キーマップ
"" save
nnoremap <Leader>w :w<CR>
nnoremap <Leader>qqq :q!<CR>
nnoremap <Leader>eee :e<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>nn :noh<CR>

"" split
nnoremap <Leader>s :<C-u>split<CR>
nnoremap <Leader>v :<C-u>vsplit<CR>

"" Terminal
tnoremap <C-w><C-n> :<C-\><C-n>
tnoremap <C-w>h :<C-\><C-n><C-w>h
tnoremap <C-w>i :<C-\><C-n><C-w>i
tnoremap <c-w>j :<c-\><c-n><c-w>j
tnoremap <c-w>k :<c-\><c-n><c-w>k


"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <Leader>t :tabnew<CR>

" Move
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
"" Sft + y => yunk to EOL
nnoremap Y y$

"" + => increment
nnoremap + <C-a>

"" - => decrement
nnoremap - <C-x>

"" pbcopy for OSX copy/paste
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

"" move line/word
nmap <C-e> $
nmap <C-a> 0
nmap <C-f> W
nmap <C-b> B
imap <C-e> <C-o>$
imap <C-a> <C-o>0
imap <C-f> <C-o>W
imap <C-b> <C-o>B

" base

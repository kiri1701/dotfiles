" キーマップ

" 矢印の無効
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>


" Move window
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h

" Move
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" + => increment
nnoremap + <C-a>

" - => decrement
nnoremap - <C-x>

" jj => esc
inoremap <silent> jj <ESC>

" for vim-anzu
" nmap n nzz<Plug>(anzu-update-search-status)
" nmap N Nzz<Plug>(anzu-update-search-status)
" nmap * <Plug>(anzu-star)
" nmap # <Plug>(anzu-sharp)
" nmap <silent> <ESC><ESC> :<C-u>nohlsearch<CR><Plug>(anzu-clear-search-status)

" for opretaor-replace
" map R <Plug>(operator-replace)

" leader
let mapleader = "\<Space>"
noremap <leader>q :q!<CR>

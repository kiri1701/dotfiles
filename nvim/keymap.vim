" キーマップ
" Split window
nmap <C-w>s :split<CR>
nmap <C-w>v :vsplit<CR>

" Move window
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h

" Tab
nmap <C-t>N :tabnew<CR>
nmap <C-t>n :tabNext<CR>
nmap <C-t>p :tabprevious<CR>

" Move
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

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
imap <C-c> <ESC>

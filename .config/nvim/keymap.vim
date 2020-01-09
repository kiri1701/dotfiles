" キーマップ
"" save
nnoremap <Leader>w :w<CR>
nnoremap <Leader>wq :wq<CR>

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
imap <C-c> <ESC>

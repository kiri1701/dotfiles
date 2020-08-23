" 【Space + f】 defx.nvimを起動
nnoremap <C-w>f :<C-u> Defx <CR>

autocmd VimEnter * execute 'Defx'
autocmd FileType defx call s:defx_my_settings()
autocmd BufWritePost * call defx#redraw()
autocmd BufEnter * call defx#redraw()

call defx#custom#option('_', {
      \ 'winwidth': 40,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 1,
      \ 'buffer_name': 'exlorer',
      \ 'toggle': 1,
      \ 'resume': 1,
      \ })

let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 2

autocmd FileType defx call s:defx_my_settings()
    function! s:defx_my_settings() abort
      nnoremap <silent><buffer><expr> <CR>
      \ defx#do_action('drop')
      " 【o】 ファイルを開く
      nnoremap <silent><buffer><expr> o
      \ defx#do_action('drop')
      " 【s】 ウィンドウを水平分割してファイルを開く
      nnoremap <silent><buffer><expr> s
      \ defx#do_action('drop', 'split')
      " 【v】 ウィンドウを垂直分割してファイルを開く
      nnoremap <silent><buffer><expr> v
      \ defx#do_action('drop', 'vsplit')
      " 【t】 タブで開く
      nnoremap <silent><buffer><expr> t
      \ defx#do_action('open', 'tabnew')
      " 【c】 ファイルをコピーする
      nnoremap <silent><buffer><expr> c
      \ defx#do_action('copy')
      " 【m】 ファイルを移動する
      nnoremap <silent><buffer><expr> m
      \ defx#do_action('move')
      " 【p】 ファイルを貼り付ける
      nnoremap <silent><buffer><expr> p
      \ defx#do_action('paste')
      " 【n】 新しいファイルを作成する
      nnoremap <silent><buffer><expr> n
      \ defx#do_action('new_file')
      " 【N】 新しいディレクトリを作成する
      nnoremap <silent><buffer><expr> N
      \ defx#do_action('new_directory')
      " 【d】 ファイルを削除する
      nnoremap <silent><buffer><expr> d
      \ defx#do_action('remove')
      " 【r】 ファイル名を変更する
      nnoremap <silent><buffer><expr> r
      \ defx#do_action('rename')
      " 【x】 ファイルを実行する
      nnoremap <silent><buffer><expr> x
      \ defx#do_action('execute_system')
      " 【yy】 ファイル/ディレクトリのパスをコピーする
      nnoremap <silent><buffer><expr> yy
      \ defx#do_action('yank_path')
      " 【.】 隠しファイルを表示/非表示する
      nnoremap <silent><buffer><expr> .
      \ defx#do_action('toggle_ignored_files')
      " 【..】 親ディレクトリに移動する
      nnoremap <silent><buffer><expr> ..
      \ defx#do_action('cd', ['..'])
      " 【~】 ホームディレクトリに移動する
      nnoremap <silent><buffer><expr> ~
      \ defx#do_action('cd')
      " 【ESC】 / 【q】 defx.nvimを終了する
      nnoremap <silent><buffer><expr> <Esc>
      \ defx#do_action('quit')
      nnoremap <silent><buffer><expr> q
      \ defx#do_action('quit')
      " 【j】 カーソルを下に移動する
      nnoremap <silent><buffer><expr> j
      \ line('.') == line('$') ? 'gg' : 'j'
      " 【k】 カーソルを上に移動する
      nnoremap <silent><buffer><expr> k
      \ line('.') == 1 ? 'G' : 'k'
      " 【cd】 Neovim上のカレントディレクトリを変更する
      nnoremap <silent><buffer><expr> cd
      \ defx#do_action('change_vim_cwd')
endfunction

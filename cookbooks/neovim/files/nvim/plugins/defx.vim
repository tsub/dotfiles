augroup defx
    au!
    au VimEnter * sil! au! FileExplorer *
    au BufEnter * if s:isdir(expand('%')) | bd | exe "Defx `expand('%')`" | endif
augroup END

function! s:isdir(dir) abort
    return !empty(a:dir) && (isdirectory(a:dir) ||
       \ (!empty($SYSTEMDRIVE) && isdirectory('/'.tolower($SYSTEMDRIVE[0]).a:dir)))
endfu

nnoremap <silent> <F2> :Defx `expand('%:p:h')` -search=`expand('%:p')` -split=vertical -winwidth=30 -direction=topleft<CR>
nnoremap <silent> <F3> :Defx `expand('%:p:h')` -search=`expand('%:p')` -split=vertical -winwidth=30 -direction=topleft -toggle<CR>

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " file/directory open
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('open') :
  \ defx#do_action('multi', ['drop', 'quit'])
  nnoremap <silent><buffer><expr> l
  \ defx#is_directory() ?
  \ defx#do_action('open') :
  \ defx#do_action('multi', ['drop', 'quit'])
  nnoremap <silent><buffer><expr> s
  \ defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
  nnoremap <silent><buffer><expr> i
  \ defx#do_action('multi', [['drop', 'split'], 'quit'])
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')

  " directory change
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')

  " file/directory action
  nnoremap [defx] <Nop>
  nmap <silent><buffer><expr> m [defx]
  nnoremap <silent> [defx]c
  \ defx#do_action('copy')
  nnoremap <silent> [defx]m
  \ defx#do_action('move')
  nnoremap <silent> [defx]p
  \ defx#do_action('paste')
  nnoremap <silent> [defx]d
  \ defx#do_action('remove')
  nnoremap <silent> [defx]r
  \ defx#do_action('rename')
  nnoremap <silent> [defx]N
  \ defx#do_action('new_directory')
  nnoremap <silent> [defx]n
  \ defx#do_action('new_file')

  " multiple selection
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')

  " view
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')

  " other
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
endfunction

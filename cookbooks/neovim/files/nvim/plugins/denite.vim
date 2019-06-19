if executable('ag')
  call denite#custom#var('file/rec', 'command',
        \ ['rg', '--follow', '--color=never', '--no-heading', '-l', ''])

  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'default_opts',
        \ ['-i', '--vimgrep'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
endif

autocmd FileType denite call s:denite_my_settings()
	function! s:denite_my_settings() abort
	  nnoremap <silent><buffer><expr> <CR>
	  \ denite#do_map('do_action')

	  nnoremap <silent><buffer><expr> p
	  \ denite#do_map('do_action', 'preview')

	  nnoremap <silent><buffer><expr> q
	  \ denite#do_map('quit')

	  nnoremap <silent><buffer><expr> i
	  \ denite#do_map('open_filter_buffer')

	  nnoremap <silent><buffer><expr> <Space>
	  \ denite#do_map('toggle_select').'j'
	endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
	function! s:denite_filter_my_settings() abort
	  imap <silent><buffer> <C-c>
    \ <Plug>(denite_filter_quit)
	endfunction

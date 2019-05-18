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

call denite#custom#map(
  \ 'insert',
  \ "<C-j>",
  \ '<denite:move_to_next_line>',
  \ 'noremap'
  \)
call denite#custom#map(
  \ 'insert',
  \ "<C-k>",
  \ '<denite:move_to_previous_line>',
  \ 'noremap'
  \)

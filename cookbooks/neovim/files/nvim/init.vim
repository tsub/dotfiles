"*****************************************************************************
"" Dein.vim
"*****************************************************************************

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let g:dein#install_process_timeout = 300

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add('Shougo/dein.vim')

  call dein#load_toml("$XDG_CONFIG_HOME/nvim/dein.toml", {'lazy': 0})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

"*****************************************************************************
"" Basic
"*****************************************************************************

set nobackup
set noswapfile

set fileformats=unix,dos,mac
set nobomb
set noundofile
let mapleader = ','
set hidden
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set backspace=indent,eol,start
set showcmd
set shell=/bin/sh
set sh=fish

"" Visual
syntax enable
set background=dark
colorscheme PaperColor
set ruler
set number
set list
set listchars=tab:>\ ,trail:_
set mouse=
hi LineNr ctermbg=none
hi CursorLine ctermbg=31 ctermfg=255

"" Mapping
inoremap <silent> jj <ESC>
noremap <C-b> <C-u>
nnoremap ; :
noremap <silent> <F5> :e!<CR>
tnoremap <silent> <ESC> <C-\><C-n>
tnoremap <silent> jj <C-\><C-n>
nnoremap <C-w><C-h> :vertical resize -5<CR>
nnoremap <C-w><C-j> :resize +5<CR>
nnoremap <C-w><C-k> :resize -5<CR>
nnoremap <C-w><C-l> :vertical resize +5<CR>
nnoremap <leader>/ :noh<CR>

"" Editor
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set breakindent
filetype plugin indent on
set tags=.tags
autocmd InsertLeave * set nopaste

"" Fix for japanese input bug
set ttimeout
set ttimeoutlen=100

"*****************************************************************************
"" Plugins
"*****************************************************************************

"" Caw
map <C-k> <Plug>(caw:hatpos:toggle)

"" Airline
let g:airline_theme = 'papercolor'
let g:airline_extensions = ['tabline', 'branch', 'whitespace', 'ale']
let g:airline_powerline_fonts = 1

" for tabline
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>p <Plug>AirlineSelectPrevTab
nmap <leader>n <Plug>AirlineSelectNextTab

" for ALE
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = '⨉ '
let g:airline#extensions#ale#warning_symbol = '⚠ '

"" NerdTree
let g:NERDTreeChDirMode = 0
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 30
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <F3> :NERDTreeToggle<CR>

"" Denite
if executable('ag')
  call denite#custom#var('file_rec', 'command',
        \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'default_opts',
        \ ['-i', '--vimgrep'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
endif

nnoremap [denite] <Nop>
nmap <C-u> [denite]

nnoremap <silent> [denite]b :<C-u>Denite buffer<CR>
nnoremap <silent> [denite]f :<C-u>Denite file_rec<CR>
nnoremap <silent> [denite]g :<C-u>Denite grep:. -buffer-name=search-buffer<CR>

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

"" vim-indent-guide
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi SpecialKey       ctermfg=240
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermfg=240 ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermfg=240 ctermbg=236
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

"" gist-vim
let g:gist_show_privates = 1
let g:gist_post_private = 1

"" atags.vim
let g:atags_build_commands_list = ["ctags -R --sort=yes --exclude='*.js' -f .tags"]
map <Leader>t :call atags#generate()<cr>

"" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#rust#racer_binary = expand('~/.cargo/bin/racer')
let g:deoplete#sources#rust#rust_source_path = '/src'

"" vim-smartinput
" overwrite key bind
inoremap <BS> <BS>

"" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 0

"" ale
let g:ale_linters = { 'ruby': ['rubocop'] }
let g:ale_sign_column_always = 1
let g:ale_rust_cargo_use_check = 1
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '⚠'
hi ALEWarningSign ctermfg=yellow
hi ALEErrorSign ctermfg=red
hi ALEInfoSign ctermfg=blue

"" neoterm
let g:neoterm_position = 'vertical'

"" vim-terraform
let g:terraform_fmt_on_save = 1

"*****************************************************************************
"" After plugin loaded
"*****************************************************************************

set expandtab
hi Normal ctermbg=none
hi NonText ctermbg=none

if filereadable($XDG_CONFIG_HOME . '/nvim/local.vim')
  source $XDG_CONFIG_HOME/nvim/local.vim
endif

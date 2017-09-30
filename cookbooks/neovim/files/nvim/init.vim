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
  call dein#load_toml("$XDG_CONFIG_HOME/nvim/dein_lazy.toml", {'lazy': 1})

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
set clipboard+=unnamedplus

"" Visual
syntax enable
set background=dark
colorscheme PaperColor
set ruler
set number
set list
set listchars=tab:\ \ ,trail:_
set mouse=
hi LineNr ctermbg=none
hi CursorLine ctermbg=31 ctermfg=255
hi Normal ctermbg=none
hi NonText ctermbg=none

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
set expandtab
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

"" ALE
hi ALEWarningSign ctermfg=yellow
hi ALEErrorSign ctermfg=red
hi ALEInfoSign ctermfg=blue
hi SignColumn ctermbg=none

"*****************************************************************************
"" Local settings
"*****************************************************************************

if filereadable($XDG_CONFIG_HOME . '/nvim/local.vim')
  source $XDG_CONFIG_HOME/nvim/local.vim
endif

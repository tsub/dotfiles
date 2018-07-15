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

" for airblade/vim-gitgutter
" ref: https://github.com/airblade/vim-gitgutter/tree/37bdd03d176c5e182c7e8dbdc79c3f71d2a04898#getting-started
set updatetime=100

"" Visual
syntax enable
set termguicolors
set background=dark
colorscheme iceberg
set ruler
set number
set list
set listchars=tab:\ \ ,trail:_
set mouse=
hi LineNr ctermbg=none guibg=none
hi Normal ctermbg=none
hi NonText ctermbg=none guibg=none

"" Mapping
inoremap <silent> jj <ESC>
noremap <C-b> <C-u>
nnoremap ; :
noremap <silent> <F5> :e!<CR>
tnoremap <silent> <C-j><C-j> <C-\><C-n>
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

"*****************************************************************************
"" Plugins
"*****************************************************************************

"" ALE
hi ALEWarningSign ctermfg=yellow guifg=yellow
hi ALEErrorSign ctermfg=red guifg=red
hi ALEInfoSign ctermfg=blue guifg=blue
hi SignColumn ctermbg=none guibg=none

"" GitGutter
hi GitGutterAdd guibg=none
hi GitGutterChange guibg=none
hi GitGutterChangeDelete guibg=none
hi GitGutterDelete guibg=none

"*****************************************************************************
"" Local settings
"*****************************************************************************

if filereadable($XDG_CONFIG_HOME . '/nvim/local.vim')
  source $XDG_CONFIG_HOME/nvim/local.vim
endif

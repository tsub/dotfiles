"*****************************************************************************
"" Basic
"*****************************************************************************

set nobackup
set noswapfile

set fileformats=unix,dos,mac
set nobomb
set noundofile
set hidden
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set backspace=indent,eol,start
set showcmd
set shell=/bin/sh
set sh=fish
set updatetime=1000
set mouse=a
set completeopt=menu,menuone,noselect

" dev container require clipper (https://github.com/wincent/clipper)
if has('mac') || getenv('REMOTE_CONTAINERS') == 'true'
  set clipboard+=unnamedplus
  " workaround: https://github.com/neovim/neovim/issues/8631
  let g:clipboard = {'copy': {'+': 'pbcopy', '*': 'pbcopy'}, 'paste': {'+': 'pbpaste', '*': 'pbpaste'}, 'name': 'pbcopy', 'cache_enabled': 0}
endif

"" Visual
set number
set list
set listchars=tab:\ \ ,trail:_
let g:vimsyn_embed='lPr'

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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

" Workaround
" See https://github.com/vim-ruby/vim-ruby/issues/248
if executable(expand('~/.asdf/shims/ruby'))
  let g:ruby_path = expand('~/.asdf/shims/ruby')
else
  let g:ruby_path = system('which ruby')
endif

"*****************************************************************************
"" Local settings
"*****************************************************************************

if filereadable($XDG_CONFIG_HOME . '/nvim/local.vim')
  source $XDG_CONFIG_HOME/nvim/local.vim
endif

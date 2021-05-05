"*****************************************************************************
"" Packer.nvim
"*****************************************************************************

lua require('plugins')
autocmd BufWritePost plugins.lua PackerCompile

"*****************************************************************************
"" Basic
"*****************************************************************************

set nobackup
set noswapfile

set fileformats=unix,dos,mac
set nobomb
set noundofile
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
set hidden
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set backspace=indent,eol,start
set showcmd
set shell=/bin/sh
set sh=fish
set clipboard+=unnamedplus
set updatetime=1000
set mouse=a

" workaround: https://github.com/neovim/neovim/issues/8631
let g:clipboard = {'copy': {'+': 'pbcopy', '*': 'pbcopy'}, 'paste': {'+': 'pbpaste', '*': 'pbpaste'}, 'name': 'pbcopy', 'cache_enabled': 0}

"" Visual
syntax enable
set termguicolors
set background=dark
colorscheme iceberg
set ruler
set number
set list
set listchars=tab:\ \ ,trail:_
let g:vimsyn_embed='lPr'
hi LineNr      ctermbg=none guibg=none
hi Normal      ctermbg=none guibg=none
hi NonText     ctermbg=none guibg=none
hi Folded      ctermbg=none guibg=none
hi EndOfBuffer ctermbg=none guibg=none
hi WarningMsg  ctermbg=none guibg=none
hi ErrorMsg    ctermbg=none guibg=none
hi Error       ctermbg=none guibg=none
hi VertSplit   ctermbg=none guibg=none

"" Mapping
inoremap <silent> jj <ESC>
nnoremap ; :
noremap <silent> <F5> :e!<CR>
tnoremap <silent> <C-j><C-j> <C-\><C-n>
tnoremap <silent> <C-w>h <C-\><C-n><CR>:wincmd h<CR>
tnoremap <silent> <C-w>k <C-\><C-n><CR>:wincmd k<CR>
tnoremap <silent> <C-w>j <C-\><C-n><CR>:wincmd j<CR>
tnoremap <silent> <C-w>l <C-\><C-n><CR>:wincmd l<CR>
nnoremap <C-w><C-h> :vertical resize -5<CR>
nnoremap <C-w><C-j> :resize +5<CR>
nnoremap <C-w><C-k> :resize -5<CR>
nnoremap <C-w><C-l> :vertical resize +5<CR>
nnoremap <leader>/ :noh<CR>

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
"" Plugins
"*****************************************************************************

"" ALE
hi ALEWarningSign ctermfg=yellow guifg=yellow ctermbg=none guibg=none
hi ALEErrorSign   ctermfg=red    guifg=red    ctermbg=none guibg=none
hi ALEInfoSign    ctermfg=blue   guifg=blue   ctermbg=none guibg=none
hi SignColumn                                 ctermbg=none guibg=none

"*****************************************************************************
"" Local settings
"*****************************************************************************

if filereadable($XDG_CONFIG_HOME . '/nvim/local.vim')
  source $XDG_CONFIG_HOME/nvim/local.vim
endif

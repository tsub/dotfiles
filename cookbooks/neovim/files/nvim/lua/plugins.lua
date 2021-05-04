-- Packer.nvim bootstrapping
-- see https://github.com/wbthomason/packer.nvim#bootstrapping
-- TODO: Move to ~/.config/nvim/lua/init.lua

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- Plugins

local packer = require('packer')

packer.init {
  display = {
    open_fn = require('packer.util').float,
  },
}

return packer.startup(function(use)
  -- lua plugins
  use {
    { 'wbthomason/packer.nvim' },
    {
      'neovim/nvim-lspconfig',
      requires = 'nvim-lua/completion-nvim',
      config = function()
        require('lsp')
      end
    },
    {
      'folke/which-key.nvim',
      -- TODO: Lazy loading
      -- cmd = { 'WhichKey' },
      -- keys = { '<leader>', '<Space>' },
      config = function()
        local wk = require('which-key')

        wk.register({
          g = {
            name = '+git',
            o = { '<cmd>OpenGithubFile<CR>', 'Open GitHub file' },
          },
          l = {
            name = '+lsp',
            r = { vim.lsp.buf.references, 'references' }
          }
        },
        { prefix = '<leader>' })
      end
    },
    {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('gitsigns').setup {
          signs = {
            -- default: text = '_'
            delete = { hl = 'GitSignsDelete', text = '│', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
          },
        }
      end
    }
  }

  -- vimscript plugins
  use {
    { 'cocopon/iceberg.vim' },
    {
      'itchyny/lightline.vim',
      config = function()
        vim.api.nvim_command([[source ~/.config/nvim/plugins/lightline.vim]])
      end
    },
    { 'tpope/vim-fugitive' },
    {
      'kana/vim-smartinput',
      config = function()
        vim.api.nvim_set_keymap('i', '<BS>', '<BS>', { noremap = true })
      end
    },
    { 'tpope/vim-endwise' },
    { 'tpope/vim-surround' },
    { 'hashivim/vim-terraform', ft = 'terraform' },
    { 'tmux-plugins/vim-tmux', ft = 'tmux' },
    { 'cespare/vim-toml' },
    { 'dag/vim-fish' },
    {
      'tyru/caw.vim',
      keys = { '<C-k>' },
      config = function()
        vim.api.nvim_set_keymap('', '<C-k>', '<Plug>(caw:hatpos:toggle)', {})
      end
    },
    {
      'scrooloose/nerdtree',
      cmd = { 'NERDTreeFind', 'NERDTreeToggle' },
      keys = { '<F2>', '<F3>' },
      setup = function()
        vim.g.NERDTreeChDirMode = 0
        vim.g.NERDTreeShowHidden = 1
        vim.g.NERDTreeWinSize = 30
      end,
      config = function()
        vim.api.nvim_set_keymap('n', '<F2>', ':NERDTreeFind<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<F3>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
      end
    },
    {
      'tyru/open-browser-github.vim',
      requires = { 'tyru/open-browser.vim', opt = true },
      cmd = {
        'OpenGithubFile',
        'OpenGithubIssue',
        'OpenGithubPullReq',
        'OpenGithubProject',
        'OpenGithubCommit'
      },
      setup = function()
        vim.g.openbrowser_github_url_exists_check = 'ignore'
      end
    },
  }
end)

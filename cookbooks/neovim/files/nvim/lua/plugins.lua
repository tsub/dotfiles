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
      requires = {
        'nvim-lua/lsp-status.nvim',
        'hrsh7th/cmp-nvim-lsp',
      },
      config = function()
        require('lsp')
      end
    },
    {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
      },
      config = function()
        local cmp = require('cmp')
        cmp.setup {
          sources = {
            { name = 'buffer' },
            { name = 'nvim_lua' },
            { name = 'nvim_lsp' },
            { name = 'path' },
          },
        }
      end,
    },
    {
      'folke/which-key.nvim',
      -- TODO: Lazy loading
      -- cmd = { 'WhichKey' },
      -- keys = { '<leader>', '<Space>' },
      config = function()
        local wk = require('which-key')

        wk.setup({ triggers = { '<leader>' } })

        wk.register({
          G = {
            name = '+git',
            g = { '<cmd>Telescope ghq list cwd=~ theme=get_dropdown<CR>', 'List ghq repository' },
            o = { '<cmd>OpenGithubFile<CR>', 'Open GitHub file' },
          },
          l = {
            name = '+lsp',
            r = { vim.lsp.buf.references, 'references' },
            d = { '<cmd>LspTroubleToggle<CR>', 'diagnostics' },
          },
          f = { '<cmd>Telescope find_files theme=get_dropdown<CR>', 'find_files' },
          b = { '<cmd>Telescope buffers theme=get_dropdown<CR>', 'buffers' },
          g = { '<cmd>Telescope live_grep theme=get_dropdown<CR>', 'live_grep' },
          p = { '<cmd>BufferLineCyclePrev<CR>', 'buffer prev' },
          n = { '<cmd>BufferLineCycleNext<CR>', 'buffer next' },
          P = {
            name = '+packer',
            u = { '<cmd>PackerUpdate<CR>', 'update' },
            s = { '<cmd>PackerSync<CR>', 'sync' },
            i = { '<cmd>PackerInstall<CR>', 'install' },
            c = { '<cmd>PackerCompile<CR>', 'compile' },
          },
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
    },
    {
      'hoob3rt/lualine.nvim',
      requires = {
        'kyazdani42/nvim-web-devicons',
        'nvim-lua/lsp-status.nvim',
        'projekt0n/github-nvim-theme',
      },
      config = function()
        local lsp_status = require('lsp-status')

        require('lualine').setup{
          options = { theme = 'github' },
          sections = {
            lualine_x = { lsp_status.status, 'encoding', 'fileformat', 'filetype' },
          },
        }
      end
    },
    {
      'folke/trouble.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function()
        require('trouble').setup {
          auto_close = true,
        }
      end
    },
    {
      'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup()
      end,
    },
    {
      'nvim-telescope/telescope.nvim',
      cmd = { 'Telescope' },
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ghq.nvim',
      },
      config = function()
        local telescope = require('telescope')

        telescope.load_extension('ghq')
        telescope.setup {
          defaults = {
            mappings = {
              i = {
                -- see https://github.com/nvim-telescope/telescope.nvim/issues/499
                ["<C-u>"] = false,
              },
            },
          },
        }
      end,
    },
    {
      'akinsho/nvim-bufferline.lua',
      requires = {
        'kyazdani42/nvim-web-devicons',
      },
      config = function()
        require('bufferline').setup {
          options = {
            separator_style = 'thin',
            diagnostics = "nvim_lsp",
          },
        }
      end,
    },
    {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
        require('nvim-treesitter.configs').setup {
          ensure_installed = "maintained",
          highlight = {
            enable = true,
          },
        }
      end,
    },
    {
      'projekt0n/github-nvim-theme',
      config = function()
        require('github-theme').setup {
          transparent = true,
          hide_inactive_statusline = true,
        }
      end,
    }
  }

  -- vimscript plugins
  use {
    { 'tpope/vim-fugitive' },
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

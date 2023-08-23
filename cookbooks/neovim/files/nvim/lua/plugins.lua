-- Packer.nvim bootstrapping
-- see https://github.com/wbthomason/packer.nvim#bootstrapping
-- TODO: Move to ~/.config/nvim/lua/init.lua

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
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
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
      },
      config = function()
        local cmp = require('cmp')
        cmp.setup {
          mapping = cmp.mapping.preset.insert({}),
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
              d = { '<cmd>Trouble<CR>', 'diagnostics' },
              f = { function() vim.lsp.buf.format({ async = true }) end, 'format' },
            },
            f = { '<cmd>Telescope find_files theme=get_dropdown follow=true<CR>', 'find_files' },
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
      tag = 'release',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('gitsigns').setup {
          signs = {
            -- default: text = '_'
            delete = { hl = 'GitSignsDelete', text = '│', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          },
          current_line_blame = true,
        }
      end
    },
    {
      'nvim-lualine/lualine.nvim',
      requires = {
        { 'kyazdani42/nvim-web-devicons', opt = true },
        'nvim-lua/lsp-status.nvim',
        'projekt0n/github-nvim-theme',
      },
      config = function()
        local lsp_status = require('lsp-status')

        require('lualine').setup {
          options = {
            theme = 'auto',
            globalstatus = true,
          },
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
      'akinsho/bufferline.nvim',
      tag = '*',
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
      -- See: https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#packernvim
      run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
      end,
      config = function()
        require('nvim-treesitter.configs').setup {
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
          options = {
            transparent = true,
          },
        }

        vim.cmd('colorscheme github_dark')
      end,
    }
  }

  -- vimscript plugins
  use {
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-endwise' },
    { 'tpope/vim-surround' },
    { 'hashivim/vim-terraform', ft = { 'terraform', 'hcl' } },
    { 'tmux-plugins/vim-tmux',  ft = 'tmux' },
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
        -- workaround (https://github.com/preservim/nerdtree/issues/1321)
        vim.g.NERDTreeMinimalMenu = 1
      end,
      config = function()
        vim.api.nvim_set_keymap('n', '<F2>', ':NERDTreeFind<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<F3>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
      end
    },
    {
      'tyru/open-browser-github.vim',
      requires = {
        {
          'tyru/open-browser.vim',
          cmd = {
            'OpenGithubFile',
            'OpenGithubIssue',
            'OpenGithubPullReq',
            'OpenGithubProject',
            'OpenGithubCommit',
          }
        },
      },
      cmd = {
        'OpenGithubFile',
        'OpenGithubIssue',
        'OpenGithubPullReq',
        'OpenGithubProject',
        'OpenGithubCommit',
      },
      setup = function()
        vim.g.openbrowser_github_url_exists_check = 'ignore'
      end
    },
    { 'towolf/vim-helm' },
    { 'gutenye/json5.vim' },
    { 'github/copilot.vim' },
    {
      'wincent/vim-clipper',
      setup = function()
        vim.g.ClipperAddress = 'host.docker.internal'
      end
    },
  }
end)

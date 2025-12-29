return {
  -- lua plugins
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
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

      wk.setup({
        triggers = { '<leader>' },
      })

      wk.add({
        { "<leader>G",  group = "git" },
        { "<leader>Gg", "<cmd>Telescope ghq list cwd=~ theme=get_dropdown<CR>",         desc = "List ghq repository" },
        { "<leader>Go", "<cmd>OpenGithubFile<CR>",                                      desc = "Open GitHub file" },
        { "<leader>L",  group = "lazy.nvim" },
        { "<leader>Lu", "<cmd>Lazy update<CR>",                                         desc = "lazy.nvim update" },
        { "<leader>b",  "<cmd>Telescope buffers theme=get_dropdown<CR>",                desc = "buffers" },
        { "<leader>f",  "<cmd>Telescope find_files theme=get_dropdown follow=true<CR>", desc = "find_files" },
        { "<leader>g",  "<cmd>Telescope live_grep theme=get_dropdown<CR>",              desc = "live_grep" },
        { "<leader>l",  group = "lsp" },
        { "<leader>ld", "<cmd>Trouble diagnostics toggle<CR>",                          desc = "diagnostics" },
        { "<leader>lf", function() vim.lsp.buf.format({ async = true }) end,            desc = "format" },
        { "<leader>lr", vim.lsp.buf.references,                                         desc = "references" },
        { "<leader>m",  "<cmd>MarkdownPreviewToggle<CR>",                               desc = "markdown preview" },
        { "<leader>n",  "<cmd>BufferLineCycleNext<CR>",                                 desc = "buffer next" },
        { "<leader>p",  "<cmd>BufferLineCyclePrev<CR>",                                 desc = "buffer prev" },
        { "<leader>c",  group = "Claude Code" },
        { "<leader>o",  "<cmd>Oil<CR>",                                                 desc = "Open oil file explorer" },
        { "<leader>M",  "<cmd>MarpWatch<CR>",                                           desc = "marp preview" },
        { "<leader>C",  group = "Copilot" },
        { "<leader>Cs", "<cmd>LspCopilotSignIn<CR>",                                    desc = "Sign in to Copilot" },
      })
    end
  },
  {
    'nvim-mini/mini.diff',
    version = '*',
    opts = {
      view = {
        signs = { add = '│', change = '│', delete = '│' },
      }
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      { 'kyazdani42/nvim-web-devicons', lazy = true },
      'projekt0n/github-nvim-theme',
    },
    opts = {
      options = {
        theme = 'auto',
        globalstatus = true,
      },
      sections = {
        lualine_x = { 'lsp_status', 'encoding', 'fileformat', 'filetype' },
      },
    },
  },
  {
    'folke/trouble.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    opts = {
      auto_close = true,
    },
  },
  {
    'windwp/nvim-autopairs',
    opts = {},
  },
  {
    'nvim-telescope/telescope.nvim',
    cmd = { 'Telescope' },
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ghq.nvim',
    },
    config = function()
      local telescope = require('telescope')

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              -- see https://github.com/nvim-telescope/telescope.nvim/issues/499
              ["<C-u>"] = false,
            },
          },
        },
        pickers = {
          find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
          },
          live_grep = {
            additional_args = function(opts)
              return { "--hidden", "--glob", "!**/.git/*" }
            end
          },
        }
      })

      telescope.load_extension('ghq')
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
    },
    opts = {
      options = {
        separator_style = 'thin',
        diagnostics = "nvim_lsp",
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    -- See: https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#packernvim
    build = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    opts = {
      highlight = {
        enable = true,
      },
    },
  },
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup({
        options = {
          transparent = true,
          terminal_colors = false,
        },
      })
      vim.cmd('colorscheme github_dark')

      -- for copilot-language-server
      vim.api.nvim_set_hl(0, 'ComplHint', { link = 'LspInlayHint' })
      vim.api.nvim_set_hl(0, 'ComplHintMore', { link = 'LspInlayHint' })
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    build = function() vim.fn['mkdp#util#install']() end,
  },
  -- {
  --   'iamcco/markdown-preview.nvim',
  --   build = 'cd app && npm install',
  --   init = function() vim.g.mkdp_filetypes = { 'markdown' } end,
  --   ft = { 'markdown' },
  -- },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      open_mapping = [[<C-t>]],
      direction = 'float',
      shell = 'fish',
    },
  },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = {
      terminal = {
        split_side = "left",
        snacks_win_opts = {
          -- See: https://github.com/coder/claudecode.nvim/issues/153
          position = "bottom",
          height = 0.4,
          width = 1.0,
          border = "rounded",
          title = " Claude ",
          title_pos = "center",
        },
        diff_opts = {
          keep_terminal_focus = true,
        },
      },
    },
    keys = {
      { "<leader>c",  nil,                              desc = "AI/Claude Code" },
      { "<leader>cc", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
      { "<leader>cr", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
      { "<leader>cC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>cm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
      { "<leader>cs", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                  desc = "Send to Claude" },
    },
  },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      -- Window-local options to use for oil buffers
      win_options = {
        signcolumn = 'yes:2',
      },
      -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
      -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
      -- Additionally, if it is a string that matches "actions.<name>",
      -- it will use the mapping at require("oil.actions").<name>
      -- Set to `false` to remove a keymap
      -- See :help oil-actions for a list of all available actions
      keymaps = {
        ["<C-t>"] = {}, -- toggleterm.nvim と被るため無効化
      },
      -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
      skip_confirm_for_simple_edits = true,
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },
    },
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
  {
    "refractalize/oil-git-status.nvim",
    dependencies = {
      "stevearc/oil.nvim",
    },
    opts = {},
  },
  {
    'nvim-mini/mini.pairs',
    version = '*',
  },
  {
    "nwiizo/marp.nvim",
    ft = "markdown",
    opts = {},
  }
}

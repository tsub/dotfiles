-- vimscript plugins
return {
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-endwise' },
  { 'tpope/vim-surround' },
  { 'hashivim/vim-terraform', ft = { 'terraform', 'hcl' } },
  { 'tmux-plugins/vim-tmux',  ft = 'tmux' },
  { 'cespare/vim-toml' },
  { 'dag/vim-fish' },
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
    dependencies = {
      {
        'tyru/open-browser.vim',
      },
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
  {
    'rhadley-recurly/vim-terragrunt',
    ft = { 'hcl' },
  },
}

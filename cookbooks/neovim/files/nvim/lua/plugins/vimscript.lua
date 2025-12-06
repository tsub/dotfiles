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
    'tyru/open-browser-github.vim',
    dependencies = {
      {
        'tyru/open-browser.vim',
      },
    },
    init = function()
      vim.g.openbrowser_github_url_exists_check = 'ignore'
    end
  },
  { 'towolf/vim-helm' },
  { 'gutenye/json5.vim' },
  {
    'rhadley-recurly/vim-terragrunt',
    ft = { 'hcl' },
  },
}

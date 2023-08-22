config_home = ENV['XDG_CONFIG_HOME'] || "#{ENV['HOME']}/.config"

node.reverse_merge!(
  alacritty: {
    home: config_home + '/alacritty'
  },
  kitty: {
    home: config_home + '/kitty'
  },
  fish: {
    home: config_home + '/fish'
  },
  neovim: {
    home: config_home
  },
  ghg: {
    version: '0.1.4'
  },
  gopath: ENV['GOPATH'] || "#{ENV['HOME']}/go",
  goroot: ENV['GOROOT'] || '/opt/homebrew/bin/go',
)

arch = run_command('uname -m').stdout.strip # workaround: node['kernel'] return nil when Darwin

include_recipe '../cookbooks/homebrew'
include_recipe '../cookbooks/zsh'
include_recipe '../cookbooks/fish'
include_recipe '../cookbooks/asdf'
include_recipe '../cookbooks/git'
include_recipe '../cookbooks/neovim'
include_recipe '../cookbooks/tmux'
include_recipe '../cookbooks/ghg' if arch == 'amd64'
include_recipe '../cookbooks/alacritty'
include_recipe '../cookbooks/goinstall'
include_recipe '../cookbooks/kitty'
include_recipe '../cookbooks/hyper'
include_recipe '../cookbooks/whalebrew' if arch == 'amd64'
include_recipe '../cookbooks/pip'
include_recipe '../cookbooks/krew'
include_recipe '../cookbooks/mas'
include_recipe '../cookbooks/helm_plugins' if arch == 'amd64'
include_recipe '../cookbooks/kubectl-neat-diff'
include_recipe '../cookbooks/opener-server'

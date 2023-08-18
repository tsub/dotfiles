# Only devcontainer
return unless ENV['REMOTE_CONTAINERS']

config_home = ENV['XDG_CONFIG_HOME'] || "#{ENV['HOME']}/.config"

node.reverse_merge!(
  gopath: ENV['GOPATH'] || "#{ENV['HOME']}/go",
  goroot: ENV['GOROOT'] || '/usr/local/go',
  fish: {
    home: config_home + '/fish'
  },
  neovim: {
    home: config_home
  },
)

include_recipe '../cookbooks/tig'
include_recipe '../cookbooks/diff-highlight'
include_recipe '../cookbooks/apt'
include_recipe '../cookbooks/neovim'
include_recipe '../cookbooks/fish'

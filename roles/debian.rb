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
include_recipe '../cookbooks/opener-client'
include_recipe '../cookbooks/helm_ls'
include_recipe '../cookbooks/rpbcopyd-client'
include_recipe '../cookbooks/claude-code'
include_recipe '../cookbooks/ccmanager'

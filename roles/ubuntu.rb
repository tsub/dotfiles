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
  gopath: ENV['GOPATH'] || "#{ENV['HOME']}/go"
)

include_recipe '../cookbooks/linuxbrew'
include_recipe '../cookbooks/fish'
include_recipe '../cookbooks/asdf'
include_recipe '../cookbooks/git'
include_recipe '../cookbooks/neovim'
include_recipe '../cookbooks/tmux'
include_recipe '../cookbooks/ghg'
include_recipe '../cookbooks/goget'

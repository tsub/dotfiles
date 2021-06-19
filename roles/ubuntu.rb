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
  rbenv: {
    ruby_version: '2.6.3'
  },
  nodenv: {
    node_version: '10.16.0'
  },
  ghg: {
    version: '0.1.4'
  },
  gopath: ENV['GOPATH'] || "#{ENV['HOME']}/go"
)

include_recipe '../cookbooks/linuxbrew'
include_recipe '../cookbooks/fish'
# include_recipe '../cookbooks/rbenv'
# include_recipe '../cookbooks/nodenv'
include_recipe '../cookbooks/git'
include_recipe '../cookbooks/neovim'
include_recipe '../cookbooks/the_silver_searcher'
include_recipe '../cookbooks/tmux'
include_recipe '../cookbooks/ghg'
include_recipe '../cookbooks/goget'
include_recipe '../cookbooks/bingo'

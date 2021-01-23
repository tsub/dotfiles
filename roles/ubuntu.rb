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
  asdf_global_version: {
    ruby: '3.0.0',
    nodejs: '10.16.0',
    terraform: '0.14.4',
    golang: '1.12.6'
  },
  ghg: {
    version: '0.1.4'
  },
  gopath: ENV['GOPATH'] || "#{ENV['HOME']}/go"
)

include_recipe '../cookbooks/linuxbrew/default.rb'
include_recipe '../cookbooks/fish/default.rb'
include_recipe '../cookbooks/asdf/default.rb'
include_recipe '../cookbooks/git/default.rb'
include_recipe '../cookbooks/neovim/default.rb'
include_recipe '../cookbooks/the_silver_searcher/default.rb'
include_recipe '../cookbooks/tmux/default.rb'
include_recipe '../cookbooks/ghg/default.rb'
include_recipe '../cookbooks/goget/default.rb'
include_recipe '../cookbooks/bingo/default.rb'

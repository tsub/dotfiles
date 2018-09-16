config_home = ENV['XDG_CONFIG_HOME'] || "#{ENV['HOME']}/.config"

node.reverse_merge!(
  alacritty: {
    home: config_home + '/alacritty'
  },
  fish: {
    home: config_home + '/fish'
  },
  neovim: {
    home: config_home
  },
  rbenv: {
    ruby_version: '2.5.1'
  },
  nodenv: {
    node_version: '8.11.3'
  },
  ghg: {
    version: '0.1.2'
  },
  gopath: ENV['GOPATH'] || "#{ENV['HOME']}/ghq"
)

include_recipe '../cookbooks/pacman/default.rb'
include_recipe '../cookbooks/aur/default.rb'
include_recipe '../cookbooks/fish/default.rb'
include_recipe '../cookbooks/rbenv/default.rb'
include_recipe '../cookbooks/nodenv/default.rb'
include_recipe '../cookbooks/git/default.rb'
include_recipe '../cookbooks/neovim/default.rb'
include_recipe '../cookbooks/the_silver_searcher/default.rb'
include_recipe '../cookbooks/tmux/default.rb'
include_recipe '../cookbooks/ghg/default.rb'
include_recipe '../cookbooks/alacritty/default.rb'
include_recipe '../cookbooks/goget/default.rb'

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
include_recipe '../cookbooks/xkeysnail/default.rb'
include_recipe '../cookbooks/service/default.rb'
include_recipe '../cookbooks/libinput-gestures/default.rb'
include_recipe '../cookbooks/albert/default.rb'
include_recipe '../cookbooks/rofi/default.rb'
include_recipe '../cookbooks/greenclip/default.rb'
include_recipe '../cookbooks/bingo/default.rb'
include_recipe '../cookbooks/kitty/default.rb'
include_recipe '../cookbooks/hyper/default.rb'

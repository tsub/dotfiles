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

arch = run_command('uname -m').stdout.strip # workaround: node['kernel'] return nil when Darwin

include_recipe '../cookbooks/homebrew/default.rb'
include_recipe '../cookbooks/zsh/default.rb'
include_recipe '../cookbooks/fish/default.rb'
include_recipe '../cookbooks/asdf/default.rb'
include_recipe '../cookbooks/git/default.rb'
include_recipe '../cookbooks/neovim/default.rb'
include_recipe '../cookbooks/the_silver_searcher/default.rb'
include_recipe '../cookbooks/tmux/default.rb'
include_recipe '../cookbooks/ghg/default.rb' if arch == 'amd64'
include_recipe '../cookbooks/alacritty/default.rb'
include_recipe '../cookbooks/goget/default.rb'
include_recipe '../cookbooks/bingo/default.rb'
include_recipe '../cookbooks/kitty/default.rb'
include_recipe '../cookbooks/hyper/default.rb'
include_recipe '../cookbooks/whalebrew/default.rb' if arch == 'amd64'
include_recipe '../cookbooks/pip/default.rb'
include_recipe '../cookbooks/krew/default.rb'
include_recipe '../cookbooks/mas/default.rb'
include_recipe '../cookbooks/helm_plugins/default.rb' if arch == 'amd64'

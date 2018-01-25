node.reverse_merge!(
  fish: {
    home: ENV['XDG_CONFIG_HOME'] + '/fish'
  },
  neovim: {
    home: ENV['XDG_CONFIG_HOME']
  },
  rbenv: {
    ruby_version: '2.4.3'
  },
  nodenv: {
    node_version: '9.4.0'
  },
  ghg: {
    version: '0.1.2'
  }
)

include_recipe '../cookbooks/homebrew/default.rb'
include_recipe '../cookbooks/fish/default.rb'
include_recipe '../cookbooks/rbenv/default.rb'
include_recipe '../cookbooks/nodenv/default.rb'
include_recipe '../cookbooks/git/default.rb'
include_recipe '../cookbooks/neovim/default.rb'
include_recipe '../cookbooks/the_silver_searcher/default.rb'
include_recipe '../cookbooks/tmux/default.rb'
include_recipe '../cookbooks/ghg/default.rb'

node.reverse_merge!(
  fish: {
    home: ENV['XDG_CONFIG_HOME'] + '/fish'
  },
  neovim: {
    home: ENV['XDG_CONFIG_HOME']
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

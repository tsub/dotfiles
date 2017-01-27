node.reverse_merge!({
  neovim: {
    home: ENV['XDG_CONFIG_HOME']
  }
})

include_recipe '../cookbooks/anyenv/default.rb'
include_recipe '../cookbooks/git/default.rb'
include_recipe '../cookbooks/neovim/default.rb'
include_recipe '../cookbooks/peco/default.rb'
include_recipe '../cookbooks/the_silver_searcher/default.rb'
include_recipe '../cookbooks/tmux/default.rb'
include_recipe '../cookbooks/zsh/default.rb'

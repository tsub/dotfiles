# Only devcontainer
return unless ENV['REMOTE_CONTAINERS']

include_recipe '../cookbooks/tig'
include_recipe '../cookbooks/diff-highlight'
include_recipe '../cookbooks/apt'

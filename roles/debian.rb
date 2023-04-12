# Only devcontainer
return unless ENV['REMOTE_CONTAINERS']

node.reverse_merge!(
  gopath: ENV['GOPATH'] || "#{ENV['HOME']}/go"
)

include_recipe '../cookbooks/tig'
include_recipe '../cookbooks/diff-highlight'
include_recipe '../cookbooks/apt'
include_recipe '../cookbooks/kubectl-neat-diff'

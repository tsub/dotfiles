node.reverse_merge!(
  user: ENV['SUDO_USER'] || ENV['USER'],
  group: ENV['SUDO_GID']
)

include_recipe File.expand_path("../../roles/#{node[:platform]}.rb", __FILE__)

# Dependency to homebrew cookbook (Install and start opener)

directory File.expand_path('~/.config/opener') do
  user node[:user]
end

link File.expand_path('~/.config/opener/config.yaml') do
  to File.expand_path('../files/config.yaml', __FILE__)
  user node[:user]
  force true
end

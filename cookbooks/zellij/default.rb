directory File.expand_path('~/.config/zellij') do
  user node[:user]
end

link File.expand_path('~/.config/zellij/config.kdl') do
  to File.expand_path('../files/config.kdl', __FILE__)
  user node[:user]
  force true
end

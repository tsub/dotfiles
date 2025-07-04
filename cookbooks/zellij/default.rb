link File.expand_path('~/.config/zellij/config.kdl') do
  to File.expand_path('../files/config.kdl', __FILE__)
  user node[:user]
  force true
end

directory File.expand_path('~/.config/mise') do
  user node[:user]
end

link File.expand_path('~/.config/mise/config.toml') do
  to File.expand_path('../files/config.toml', __FILE__)
  user node[:user]
  force true
end

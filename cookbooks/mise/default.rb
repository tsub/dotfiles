directory File.expand_path('~/.config/mise') do
  user node[:user]
end

link File.expand_path('~/.config/mise/config.toml') do
  to File.expand_path('../files/config.toml', __FILE__)
  user node[:user]
  force true
end

link File.expand_path('~/.config/mise/conf.d') do
  to File.expand_path('../files/conf.d', __FILE__)
  user node[:user]
  force true
end

execute 'mise bootstrap --yes' do
  user node[:user]
end

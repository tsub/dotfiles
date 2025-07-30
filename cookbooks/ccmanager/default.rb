directory File.expand_path('~/.config/ccmanager') do
  user node[:user]
end

link File.expand_path('~/.config/ccmanager/config.json') do
  to File.expand_path('../files/config.json', __FILE__)
  user node[:user]
  force true
end

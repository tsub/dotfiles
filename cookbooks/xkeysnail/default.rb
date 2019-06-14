directory File.expand_path('~/.config') do
  user node[:user]
end

directory File.expand_path('~/.config/xkeysnail') do
  user node[:user]
end

link File.expand_path('~/.config/xkeysnail/config.py') do
  to File.expand_path('../files/config.py', __FILE__)
  user node[:user]
  force true
end

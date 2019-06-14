directory File.expand_path('~/.config') do
  user node[:user]
end

link File.expand_path('~/.config/greenclip.cfg') do
  to File.expand_path('../files/greenclip.cfg', __FILE__)
  user node[:user]
  force true
end

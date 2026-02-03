directory File.expand_path('~/.config/colima/default') do
  user node[:user]
end

link File.expand_path('~/.config/colima/default/colima.yaml') do
  to File.expand_path('../files/colima.yaml', __FILE__)
  user node[:user]
  force true
end

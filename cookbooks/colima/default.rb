link File.expand_path('~/.colima/default/colima.yaml') do
  to File.expand_path('../files/colima.yaml', __FILE__)
  user node[:user]
  force true
end

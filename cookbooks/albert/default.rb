directory File.expand_path('~/.config') do
  user node[:user]
end

directory File.expand_path('~/.config/albert') do
  user node[:user]
end

link File.expand_path('~/.config/albert/albert.conf') do
  to File.expand_path('../files/albert.conf', __FILE__)
  user node[:user]
  force true
end

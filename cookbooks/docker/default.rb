directory File.expand_path('~/.docker') do
  user node[:user]
end

link File.expand_path('~/.docker/config.json') do
  to File.expand_path('../files/config.json', __FILE__)
  user node[:user]
  force true
end

directory File.expand_path('~/.local/bin') do
  user node[:user]
end

link File.expand_path('~/.local/bin/docker-credential-gh') do
  to File.expand_path('../files/docker-credential-gh', __FILE__)
  user node[:user]
  force true
end

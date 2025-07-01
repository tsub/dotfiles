# See: https://github.com/superbrothers/opener#remote-environment

if node['platform'] == 'debian'
  package 'netcat-openbsd'
else
  package 'netcat'
end

link File.expand_path('/usr/local/bin/open') do
  to File.expand_path('../files/open', __FILE__)
  force true
end

link File.expand_path('/usr/local/bin/xdg-open') do
  to File.expand_path('../files/open', __FILE__)
  force true
end

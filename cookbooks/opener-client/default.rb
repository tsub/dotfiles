# See: https://github.com/superbrothers/opener#remote-environment

package 'netcat'

directory File.expand_path('~/.config') do
  user node[:user]
end

link File.expand_path('/usr/local/bin/open') do
  to File.expand_path('../files/open', __FILE__)
  force true
end

link File.expand_path('/usr/local/bin/xdg-open') do
  to File.expand_path('../files/open', __FILE__)
  force true
end

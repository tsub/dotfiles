# See: https://github.com/superbrothers/opener#remote-environment

package 'netcat'

execute 'curl -Lo /usr/local/bin/open https://raw.githubusercontent.com/superbrothers/opener/master/bin/open' do
  not_if 'test -f /usr/local/bin/open'
end

file '/usr/local/bin/open' do
  mode 755
end

execute 'curl -Lo /usr/local/bin/open https://raw.githubusercontent.com/superbrothers/opener/master/bin/xdg-open' do
  not_if 'test -f /usr/local/bin/xdg-open'
end

file '/usr/local/bin/xdg-open' do
  mode 755
end

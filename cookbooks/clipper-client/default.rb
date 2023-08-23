# See: https://github.com/wincent/clipper#configuring-zsh-or-bash

package 'netcat'

link File.expand_path('/usr/local/bin/pbcopy') do
  to File.expand_path('../files/pbcopy', __FILE__)
  force true
end

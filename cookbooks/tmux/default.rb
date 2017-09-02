package 'tmux'
package 'reattach-to-user-namespace'
package 'urlview'

link File.expand_path('~/.tmux.conf') do
  to File.expand_path('../files/.tmux.conf', __FILE__)
end

directory File.expand_path('~/.tmux/plugins')

git File.expand_path('~/.tmux/plugins/tpm') do
  repository 'https://github.com/tmux-plugins/tpm.git'
end

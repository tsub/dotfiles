package 'tmux'
package 'reattach-to-user-namespace'
package 'urlview'

link "#{node[:home]}/.tmux.conf" do
  to File.expand_path('../files/.tmux.conf', __FILE__)
end

directory "#{node[:home]}/.tpm/plugins"

git "#{node[:home]}/.tpm/plugins/tpm" do
  repository 'https://github.com/tmux-plugins/tpm.git'
end

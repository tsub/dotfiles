package 'git'
package 'tig'
package 'gibo'
package 'gnupg2'

## Git

link "#{node[:home]}/.gitconfig" do
  to File.expand_path('../files/.gitconfig', __FILE__)
end

template "#{node[:home]}/.gitconfig.local" do
  source File.expand_path('../templates/.gitconfig.local.erb', __FILE__)
  not_if "test -f #{node[:home]}/.gitconfig.local"
end

link "#{node[:home]}/.git_commit_messages" do
  to File.expand_path('../files/.git_commit_messages', __FILE__)
end

link "#{node[:home]}/.gitignore_global" do
  to File.expand_path('../files/.gitignore_global', __FILE__)
end

## tig

link "#{node[:home]}/.tigrc" do
  to File.expand_path('../files/.tigrc', __FILE__)
end

## gnupg2

directory "#{node[:home]}/.gnupg"

link "#{node[:home]}/.gnupg/gpg-agent.conf" do
  to File.expand_path('../files/.gnupg/gpg-agent.conf', __FILE__)
end

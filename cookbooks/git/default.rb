arch = run_command('uname -m').stdout.strip # workaround: node['kernel'] return nil when Darwin

## Git

link File.expand_path('~/.gitconfig') do
  to File.expand_path('../files/.gitconfig', __FILE__)
  user node[:user]
  force true
end

template File.expand_path('~/.gitconfig.local') do
  source File.expand_path('../templates/.gitconfig.local.erb', __FILE__)
  owner node[:user]
  group node[:group]
  not_if 'test -f ~/.gitconfig.local'
end

link File.expand_path('~/.git_commit_messages') do
  to File.expand_path('../files/.git_commit_messages', __FILE__)
  user node[:user]
  force true
end

directory File.expand_path('~/.config') do
  user node[:user]
end

link File.expand_path('~/.config/git') do
  to File.expand_path('../files/.config/git', __FILE__)
  user node[:user]
  force true
end

## tig

link File.expand_path('~/.tigrc') do
  to File.expand_path('../files/.tigrc', __FILE__)
  user node[:user]
  force true
end

## gnupg

directory File.expand_path('~/.gnupg') do
  user node[:user]
  mode '0700'
end

link File.expand_path('~/.gnupg/gpg-agent.conf') do
  to File.expand_path("../files/.gnupg/gpg-agent.#{node[:platform]}.#{arch}.conf", __FILE__)
  user node[:user]
  force true
end

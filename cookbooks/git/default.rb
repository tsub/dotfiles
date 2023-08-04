arch = run_command('uname -m').stdout.strip # workaround: node['kernel'] return nil when Darwin

## Git

directory File.expand_path('~/.config') do
  user node[:user]
end

link File.expand_path('~/.config/git') do
  to File.expand_path('../files/.config/git', __FILE__)
  user node[:user]
  force true
end

template File.expand_path('~/.config/git/config-local') do
  source File.expand_path('../templates/.gitconfig-local.erb', __FILE__)
  owner node[:user]
  group node[:group]
  not_if 'test -f ~/.config/git/config-local'
end

## tig

link File.expand_path('~/.tigrc') do
  to File.expand_path('../files/.tigrc', __FILE__)
  user node[:user]
  force true
end

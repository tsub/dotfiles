tmp_dir = '/tmp/kubectl-neat-diff'

git tmp_dir do
  repository 'https://github.com/sh0rez/kubectl-neat-diff'
  user node[:user]
  not_if 'which kubectl-neat-diff'
end

execute 'make install' do
  cwd tmp_dir
  user node[:user]
  not_if 'which kubectl-neat-diff'
end

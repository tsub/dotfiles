tmp_dir = '/tmp/kubectl-neat-diff'
install_path = "#{node['gopath']}/bin/kubectl-neat-diff"

git tmp_dir do
  repository 'https://github.com/sh0rez/kubectl-neat-diff'
  user node[:user]
  not_if "test -x #{install_path}"
end

execute 'make install' do
  cwd tmp_dir
  user node[:user]
  not_if "test -x #{install_path}"
end

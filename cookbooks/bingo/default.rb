# See https://github.com/saibing/bingo/wiki/Install

git File.expand_path("#{Dir.tmpdir}/bingo") do
  repository 'https://github.com/saibing/bingo.git'
  user node[:user]
  not_if 'which bingo'
end

execute "cd bingo && GO111MODULE=on GOPATH=#{node[:gopath]} /home/linuxbrew/.linuxbrew/bin/go install" do
  cwd Dir.tmpdir
  user node[:user]
  not_if 'which bingo'
end

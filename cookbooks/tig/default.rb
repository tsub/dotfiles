tig_install_dir = Dir.tmpdir
execute "git clone http://github.com/jonas/tig #{tig_install_dir}/tig" do
  user node[:user]
  not_if 'which tig'
end

execute "make prefix=/usr/local && make install prefix=/usr/local" do
  cwd "#{tig_install_dir}/tig"
  user node[:user]
  not_if 'which tig'
end

link File.expand_path('~/.tigrc') do
  to File.expand_path('../files/.tigrc', __FILE__)
  user node[:user]
  force true
end

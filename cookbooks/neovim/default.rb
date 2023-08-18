if node[:platform] == 'debian'
  package 'cmake'

  clone_path = File.expand_path("#{Dir.tmpdir}/neovim")

  git clone_path do
    repository 'https://github.com/neovim/neovim.git'
    user node[:user]
    depth 1
    not_if 'which nvim'
  end

  execute "cd #{clone_path} && make CMAKE_BUILD_TYPE=Release && sudo make install" do
    user node[:user]
    not_if 'which nvim'
  end
end

directory node[:neovim][:home] do
  user node[:user]
end

link "#{node[:neovim][:home]}/nvim" do
  to File.expand_path('../files/nvim', __FILE__)
  user node[:user]
  force true
end

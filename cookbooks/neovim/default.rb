if node[:platform] == 'debian'
  package 'cmake'
  git File.expand_path("#{Dir.tmpdir}/neovim") do
    repository 'https://github.com/neovim/neovim.git'
    user node[:user]
    depth 1
    not_if 'which neovim'
  end

  execute 'make CMAKE_BUILD_TYPE=Release && sudo make install' do
    cwd File.expand_path("#{Dir.tmpdir}/neovim")
    user node[:user]
    not_if 'which neovim'
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

directory node[:neovim][:home] do
  user node[:user]
end

link "#{node[:neovim][:home]}/nvim" do
  to File.expand_path('../files/nvim', __FILE__)
  user node[:user]
end

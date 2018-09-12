directory node[:neovim][:home]

link "#{node[:neovim][:home]}/nvim" do
  to File.expand_path('../files/nvim', __FILE__)
end

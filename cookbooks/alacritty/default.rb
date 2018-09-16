directory node[:alacritty][:home] do
  user node[:user]
end

arch = node[:platform] == 'darwin' ? 'macos' : 'linux'

link "#{node[:alacritty][:home]}/alacritty.yml" do
  to File.expand_path("../files/alacritty/alacritty.#{arch}.yml", __FILE__)
  user node[:user]
end

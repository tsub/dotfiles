directory node[:alacritty][:home] do
  user node[:user]
end

link "#{node[:alacritty][:home]}/alacritty.toml" do
  to File.expand_path("../files/alacritty/alacritty.#{node[:platform]}.toml", __FILE__)
  user node[:user]
  force true
end

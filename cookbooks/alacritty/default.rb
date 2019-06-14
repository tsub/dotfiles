directory node[:alacritty][:home] do
  user node[:user]
end

link "#{node[:alacritty][:home]}/alacritty.yml" do
  to File.expand_path("../files/alacritty/alacritty.#{node[:platform]}.yml", __FILE__)
  user node[:user]
  force true
end

directory node[:alacritty][:home]

link "#{node[:alacritty][:home]}/alacritty.yml" do
  to File.expand_path('../files/alacritty/alacritty.yml', __FILE__)
end

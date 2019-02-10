directory node[:kitty][:home] do
  user node[:user]
end

link "#{node[:kitty][:home]}/kitty.conf" do
  to File.expand_path('../files/kitty.conf', __FILE__)
  user node[:user]
end

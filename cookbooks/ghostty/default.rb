directory node[:ghostty][:home] do
  user node[:user]
end

link node[:ghostty][:home] do
  to File.expand_path('../files/config', __FILE__)
  user node[:user]
  force true
end

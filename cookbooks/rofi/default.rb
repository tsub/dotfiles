directory File.expand_path('~/.config') do
  user node[:user]
end

directory File.expand_path('~/.cache') do
  user node[:user]
end

directory File.expand_path('~/.cache/rofi-github') do
  user node[:user]
end

link File.expand_path('~/.config/rofi') do
  to File.expand_path('../files/rofi', __FILE__)
  user node[:user]
  force true
end

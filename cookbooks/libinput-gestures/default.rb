directory File.expand_path('~/.config') do
  user node[:user]
end

link File.expand_path('~/.config/libinput-gestures.conf') do
  to File.expand_path('../files/libinput-gestures.conf', __FILE__)
  user node[:user]
end

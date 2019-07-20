link File.expand_path('~/.asdfrc') do
  to File.expand_path('../../files/.asdfrc', __FILE__)
  user node[:user]
  force true
end

link File.expand_path('~/.default-gems') do
  to File.expand_path('../../files/.default-gems', __FILE__)
  user node[:user]
  force true
end

link File.expand_path('~/.gemrc') do
  to File.expand_path('../../files/.gemrc', __FILE__)
  user node[:user]
  force true
end

link File.expand_path('~/.bundle') do
  to File.expand_path('../../files/.bundle', __FILE__)
  user node[:user]
  force true
end

link File.expand_path('~/.default-npm-packages') do
  to File.expand_path('../../files/.default-npm-packages', __FILE__)
  user node[:user]
  force true
end

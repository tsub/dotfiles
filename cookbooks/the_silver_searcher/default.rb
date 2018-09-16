link File.expand_path('~/.agignore') do
  to File.expand_path('../files/.agignore', __FILE__)
  user node[:user]
end

link File.expand_path('~/.zshenv') do
  to File.expand_path('../files/.zshenv', __FILE__)
  user node[:user]
  force true
end

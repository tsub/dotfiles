link File.expand_path('~/.hyper.js') do
  to File.expand_path('../files/.hyper.js', __FILE__)
  user node[:user]
  force true
end

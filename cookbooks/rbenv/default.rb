define :rbenv do
  execute "rbenv install #{params[:name]}" do
    user node[:user]
    not_if "test -d ~/.rbenv/versions/#{params[:name]}"
  end

  execute "rbenv global #{params[:name]}" do
    user node[:user]
    not_if "test $(cat ~/.rbenv/version) = #{params[:name]}"
  end
end

link File.expand_path('~/.gemrc') do
  to File.expand_path('../files/.gemrc', __FILE__)
  user node[:user]
  force true
end

link File.expand_path('~/.bundle') do
  to File.expand_path('../files/.bundle', __FILE__)
  user node[:user]
  force true
end

directory File.expand_path('~/.rbenv/plugins') do
  user node[:user]
end

git File.expand_path('~/.rbenv/plugins/rbenv-each') do
  repository 'https://github.com/rbenv/rbenv-each.git'
  user node[:user]
end

git File.expand_path('~/.rbenv/plugins/rbenv-default-gems') do
  repository 'https://github.com/rbenv/rbenv-default-gems.git'
  user node[:user]
end

link File.expand_path('~/.rbenv/default-gems') do
  to File.expand_path('../files/.rbenv/default-gems', __FILE__)
  user node[:user]
  force true
end

# Install Ruby after installing rbenv-default-gems
rbenv node[:rbenv][:ruby_version]

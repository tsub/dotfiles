define :nodenv do
  execute "nodenv install #{params[:name]}" do
    user node[:user]
    not_if "test -d ~/.nodenv/versions/#{params[:name]}"
  end

  execute "nodenv global #{params[:name]}" do
    user node[:user]
    not_if "test $(cat ~/.nodenv/version) = #{params[:name]}"
  end
end

nodenv node[:nodenv][:node_version]

directory File.expand_path('~/.nodenv/plugins') do
  user node[:user]
end

git File.expand_path('~/.nodenv/plugins/nodenv-default-packages') do
  repository 'https://github.com/nodenv/nodenv-default-packages.git'
  user node[:user]
end

link File.expand_path('~/.nodenv/default-packages') do
  to File.expand_path('../files/.nodenv/default-packages', __FILE__)
  user node[:user]
end

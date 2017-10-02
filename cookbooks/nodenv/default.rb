package 'nodenv'

define :nodenv do
  execute "nodenv install #{params[:name]}" do
    not_if "test -d ~/.nodenv/versions/#{params[:name]}"
  end

  execute "nodenv global #{params[:name]}" do
    not_if "test $(cat ~/.nodenv/version) = #{params[:name]}"
  end
end

nodenv node[:nodenv][:node_version]

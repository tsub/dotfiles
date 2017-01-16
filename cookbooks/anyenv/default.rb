git "#{node[:home]}/.anyenv" do
  repository 'https://github.com/riywo/anyenv.git'
end

directory "#{node[:home]}/.anyenv/plugins"

git "#{node[:home]}/.anyenv/plugins/anyenv-update" do
  repository 'https://github.com/znz/anyenv-update.git'
end

define :anyenv do
  anyenv_bin = "#{node[:home]}/.anyenv/bin/anyenv"

  execute "#{anyenv_bin} install #{params[:name]}" do
    not_if "test -d #{node[:home]}/.anyenv/envs/#{params[:name]}"
  end
end

define :nodenv, binary: nil do
  nodenv_bin = params[:binary] || "#{node[:home]}/.nodenv/bin/nodenv"

  execute "#{nodenv_bin} install #{params[:name]}" do
    not_if "test -d #{node[:home]}/.anyenv/envs/nodenv/versions/#{params[:name]}"
  end
end

define :rbenv, binary: nil do
  rbenv_bin = params[:binary] || "#{node[:home]}/.rbenv/bin/rbenv"

  execute "#{rbenv_bin} install #{params[:name]}" do
    not_if "test -d #{node[:home]}/.anyenv/envs/rbenv/versions/#{params[:name]}"
  end
end

include_recipe 'recipes/nodenv.rb'
include_recipe 'recipes/rbenv.rb'

git File.expand_path('~/.anyenv') do
  repository 'https://github.com/riywo/anyenv.git'
end

directory File.expand_path('~/.anyenv/plugins')

git File.expand_path('~/.anyenv/plugins/anyenv-update') do
  repository 'https://github.com/znz/anyenv-update.git'
end

directory File.expand_path('~/.anyenv/envs')

define :anyenv do
  anyenv_bin = '~/.anyenv/bin/anyenv'

  execute "#{anyenv_bin} install #{params[:name]}" do
    not_if "test -d ~/.anyenv/envs/#{params[:name]}"
  end
end

define :nodenv, binary: nil do
  nodenv_bin = params[:binary] || '~/.nodenv/bin/nodenv'

  execute "#{nodenv_bin} install #{params[:name]}" do
    not_if "test -d ~/.anyenv/envs/nodenv/versions/#{params[:name]}"
  end

  execute "#{nodenv_bin} global #{params[:name]}" do
    not_if "test $(cat ~/.anyenv/envs/nodenv/version) = #{params[:name]}"
  end
end

define :rbenv, binary: nil do
  rbenv_bin = params[:binary] || '~/.rbenv/bin/rbenv'

  execute "#{rbenv_bin} install #{params[:name]}" do
    not_if "test -d ~/.anyenv/envs/rbenv/versions/#{params[:name]}"
  end

  execute "#{rbenv_bin} global #{params[:name]}" do
    not_if "test $(cat ~/.anyenv/envs/rbenv/version) = #{params[:name]}"
  end
end

include_recipe 'recipes/nodenv.rb'
include_recipe 'recipes/rbenv.rb'

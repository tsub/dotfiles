package 'rbenv'
package 'rbenv-default-gems'

define :rbenv do
  execute "rbenv install #{params[:name]}" do
    not_if "test -d ~/.rbenv/versions/#{params[:name]}"
  end

  execute "rbenv global #{params[:name]}" do
    not_if "test $(cat ~/.rbenv/version) = #{params[:name]}"
  end
end

rbenv node[:rbenv][:ruby_version]

link File.expand_path('~/.gemrc') do
  to File.expand_path('../files/.gemrc', __FILE__)
end

link File.expand_path('~/.bundle') do
  to File.expand_path('../files/.bundle', __FILE__)
end

link File.expand_path('~/.rbenv/default-gems') do
  to File.expand_path('../files/.rbenv/default-gems', __FILE__)
end

directory File.expand_path('~/.rbenv/plugins')

git File.expand_path('~/.rbenv/plugins/rbenv-each') do
  repository 'https://github.com/rbenv/rbenv-each.git'
end

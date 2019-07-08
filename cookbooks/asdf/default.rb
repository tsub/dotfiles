define :asdf_plugin do
  execute "asdf plugin-add #{params[:name]}" do
    user node[:user]
    not_if "test -d ~/.asdf/plugins/#{params[:name]}"
    notifies :run, 'execute[import-release-team-keyring]'
  end

  execute 'import-release-team-keyring' do
    command 'bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring'
    user node[:user]
    action :nothing
    only_if { params[:name] == 'nodejs' }
  end
end

define :asdf, version: nil do
  execute "asdf install #{params[:name]} #{params[:version]}" do
    user node[:user]
    not_if "test -d ~/.asdf/installs/#{params[:name]}/#{params[:version]}"
  end

  execute "asdf global #{params[:name]} #{params[:version]}" do
    user node[:user]
    not_if "test -d ~/.asdf/installs/#{params[:name]}/#{params[:version]}"
  end
end

link File.expand_path('~/.asdfrc') do
  to File.expand_path('../files/.asdfrc', __FILE__)
  user node[:user]
  force true
end

asdf_plugin 'nodejs'
asdf_plugin 'ruby'
asdf_plugin 'terraform'
asdf_plugin 'golang'

link File.expand_path('~/.default-gems') do
  to File.expand_path('../files/.default-gems', __FILE__)
  user node[:user]
  force true
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

link File.expand_path('~/.default-npm-packages') do
  to File.expand_path('../files/.default-npm-packages', __FILE__)
  user node[:user]
  force true
end

asdf 'nodejs' do
  version node[:asdf_global_version][:nodejs]
end

asdf 'ruby' do
  version node[:asdf_global_version][:ruby]
end

asdf 'terraform' do
  version node[:asdf_global_version][:terraform]
end

asdf 'golang' do
  version node[:asdf_global_version][:golang]
end

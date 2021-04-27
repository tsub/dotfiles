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

define :asdf do
  execute "asdf install #{params[:name]} latest" do
    user node[:user]
    not_if "test -d ~/.asdf/installs/#{params[:name]}/$(asdf latest #{params[:name]})"
  end

  # TODO: https://github.com/asdf-vm/asdf/pull/802 がリリースされたら "asdf global #{params[:name]} latest" に置き換えできる
  execute "asdf global #{params[:name]} $(asdf latest #{params[:name]})" do
    user node[:user]
    not_if "asdf current #{params[:name]} | grep $(asdf latest #{params[:name]})"
  end
end

include_recipe 'recipes/settings.rb'
include_recipe 'recipes/asdf_plugin.rb'
include_recipe 'recipes/asdf.rb'

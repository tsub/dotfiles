define :asdf_plugin, git: nil do
  git_url = params[:git] ? ' ' + params[:git] : nil

  execute "~/.asdf/bin/asdf plugin-add #{params[:name]}#{git_url}" do
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

  execute "~/.asdf/bin/asdf global #{params[:name]} system" do
    user node[:user]
    not_if "grep '#{params[:name]} system' ~/.tool-versions"
  end
end

execute 'git clone https://github.com/asdf-vm/asdf.git ~/.asdf' do
  user node[:user]
  not_if 'test -d ~/.asdf'
end

link File.expand_path('~/.config/fish/completions/asdf.fish') do
  to File.expand_path('~/.asdf/completions/asdf.fish')
  user node[:user]
  force true
end

include_recipe 'recipes/settings.rb'
include_recipe 'recipes/asdf_plugin.rb'

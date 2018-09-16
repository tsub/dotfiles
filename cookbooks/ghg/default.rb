arch = node[:platform] == 'darwin' ? 'darwin' : 'linux'
ext  = node[:platform] == 'darwin' ? 'zip' : 'tar.gz'

ghg_archived_name = "ghg_v#{node[:ghg][:version]}_#{arch}_amd64.#{ext}"
ghg_url = "https://github.com/Songmu/ghg/releases/download/v#{node[:ghg][:version]}/#{ghg_archived_name}"

execute "curl -fSL -o /tmp/#{ghg_archived_name} #{ghg_url}" do
  not_if 'test -x /usr/local/bin/ghg'
  user node[:user]
end

if ext == 'zip'
  execute "unzip -d /tmp/ /tmp/#{ghg_archived_name}" do
    not_if 'test -x /usr/local/bin/ghg'
    user node[:user]
  end
elsif ext == 'tar.gz'
  execute "tar -zxf /tmp/#{ghg_archived_name} -C /tmp/" do
    not_if 'test -x /usr/local/bin/ghg'
    user node[:user]
  end
end

execute "mv /tmp/ghg_v#{node[:ghg][:version]}_#{arch}_amd64/ghg /usr/local/bin" do
  not_if 'test -x /usr/local/bin/ghg'
  user node[:user]
end

define :ghg, version: nil, cli_name: nil, alias_name: nil do
  # workaround: Avoid nil to string -> '[]'
  version = params[:version] ? "@v#{params[:version]}" : ''

  execute "ghg get #{params[:name]}#{version}" do
    tool_name = params[:cli_name] || params[:name].split('/').last
    user node[:user]
    not_if "test -x ~/.ghg/bin/#{tool_name}"
  end

  if params[:alias_name] && params[:cli_name]
    link File.expand_path("~/.ghg/bin/#{params[:alias_name]}") do
      to File.expand_path("~/.ghg/bin/#{params[:cli_name]}")
      user node[:user]
    end
  end
end

include_recipe 'recipes/ghg.rb'

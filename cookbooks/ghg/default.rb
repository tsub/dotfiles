ghg_archived_name = "ghg_v#{node[:ghg][:version]}_darwin_amd64.zip"
ghg_url = "https://github.com/Songmu/ghg/releases/download/v#{node[:ghg][:version]}/#{ghg_archived_name}"

execute "curl -fSL -o /tmp/#{ghg_archived_name} #{ghg_url}" do
  not_if 'test -x /usr/local/bin/ghg'
end

execute "unzip -d /tmp/ /tmp/#{ghg_archived_name}" do
  not_if 'test -x /usr/local/bin/ghg'
end

execute "mv /tmp/ghg_v#{node[:ghg][:version]}_darwin_amd64/ghg /usr/local/bin" do
  not_if 'test -x /usr/local/bin/ghg'
end

define :ghg, version: nil, cli_name: nil, alias_name: nil do
  # workaround: Avoid nil to string -> '[]'
  version = params[:version] ? "@v#{params[:version]}" : ''

  execute "ghg get #{params[:name]}#{version}" do
    tool_name = params[:cli_name] || params[:name].split('/').last
    not_if "test -x ~/.ghg/bin/#{tool_name}"
  end

  if params[:alias_name] && params[:cli_name]
    link File.expand_path("~/.ghg/bin/#{params[:alias_name]}") do
      to File.expand_path("~/.ghg/bin/#{params[:cli_name]}")
    end
  end
end

include_recipe 'recipes/ghg.rb'

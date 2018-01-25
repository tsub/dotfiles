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

define :ghg do
  execute "ghg get #{params[:name]}" do
    tool_name = params[:name].split('/').last
    not_if "test -x ~/.ghg/bin/#{tool_name}"
  end
end

include_recipe 'recipes/ghg.rb'

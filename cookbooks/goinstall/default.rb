case node[:platform]
when 'ubuntu'
  package 'golang'
when 'darwin'
  package 'go'
end

define :goinstall, binary_name: nil, version: 'latest' do
  execute "GOPATH=#{node[:gopath]} go install #{params[:name]}@#{params[:version]}" do
    user node[:user]
    not_if "test -x #{node[:gopath]}/bin/#{params[:name].split('/').last}"
  end
end

include_recipe 'recipes/goinstall.rb'

define :goget, binary_name: nil do
  execute "GOPATH=#{node[:gopath]} go get #{params[:name]}" do
    user node[:user]
    not_if "test -x #{node[:gopath]}/bin/#{params[:name].split('/').last}"
  end
end

include_recipe 'recipes/goget.rb'

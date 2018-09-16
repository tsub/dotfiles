define :goget do
  execute "GOPATH=#{node[:gopath]} go get #{params[:name]}" do
    user node[:user]
    not_if "test -d #{node[:gopath]}/src/#{params[:name]}"
  end
end

include_recipe 'recipes/goget.rb'

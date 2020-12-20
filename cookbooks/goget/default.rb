define :goget, binary_name: nil do
  execute "GOPATH=#{node[:gopath]} /home/linuxbrew/.linuxbrew/bin/go get #{params[:name]}" do
    user node[:user]

    if params[:binary_name]
      not_if "test -x #{node[:gopath]}/bin/#{params[:binary_name]}"
    else
      not_if "test -d #{node[:gopath]}/src/#{params[:name]}"
    end
  end
end

include_recipe 'recipes/goget.rb'

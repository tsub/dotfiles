define :goget do
  execute "go get #{params[:name]}" do
    not_if "test -d $GOPATH/src/#{params[:name]}"
  end
end

include_recipe 'recipes/goget.rb'

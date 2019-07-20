define :whalebrew do
  execute "whalebrew install #{params[:name]}" do
    user node[:user]
    not_if "whalebrew list | grep #{params[:name]}"
  end
end

include_recipe 'recipes/whalebrew.rb'

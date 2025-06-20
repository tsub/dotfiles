define :npm do
  execute "npm install -g #{params[:name]}" do
    user node[:user]
    not_if "npm ls -g | grep #{params[:name]}"
  end
end

include_recipe 'recipes/npm.rb'

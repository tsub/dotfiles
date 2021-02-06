define :pip do
  execute "pip install --user #{params[:name]}" do
    user node[:user]
    not_if "pip list | grep #{params[:name]}"
  end
end

include_recipe 'recipes/pip.rb'

define :pip do
  execute "pip3 install --user #{params[:name]}" do
    user node[:user]
    not_if "pip3 list | grep #{params[:name]}"
  end
end

include_recipe 'recipes/pip.rb'

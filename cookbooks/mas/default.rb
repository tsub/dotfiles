define :mas, app_id: nil do
  execute "mas install #{params[:app_id]}" do
    user node[:user]
    not_if "mas list | grep #{params[:app_id]}"
  end
end

include_recipe 'recipes/mas'

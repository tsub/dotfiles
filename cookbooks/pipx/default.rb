define :pipx do
  execute "pipx install #{params[:name]}" do
    user node[:user]
    not_if "pipx list | grep #{params[:name]}"
  end
end

include_recipe 'recipes/pipx.rb'

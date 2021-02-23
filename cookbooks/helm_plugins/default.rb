define :helm_plugin, install_url: nil do
  execute "helm plugin install #{params[:install_url]}" do
    user node[:user]
    not_if "helm plugin list | grep #{params[:name]}"
  end
end

include_recipe 'recipes/helm_plugin.rb'

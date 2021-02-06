define :krew do
  execute "kubectl krew install #{params[:name]}" do
    user node[:user]
    not_if "test -d ~/.krew/store/#{params[:name]}"
  end
end

include_recipe 'recipes/krew.rb'

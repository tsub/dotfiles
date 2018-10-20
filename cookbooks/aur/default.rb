define :yay do
  execute "yay -S --noconfirm #{params[:name]}" do
    user node[:user]
    not_if "yay -Q #{params[:name]}"
  end
end

git File.expand_path('/var/tmp/yay') do
  repository 'https://aur.archlinux.org/yay.git'
  user node[:user]
  not_if 'which yay'
end

execute 'cd yay && makepkg -si' do
  cwd '/var/tmp'
  user node[:user]
  not_if 'which yay'
end

include_recipe 'recipes/yay.rb'

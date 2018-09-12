define :yay do
  execute "yay -S --noconfirm #{params[:name]}" do
    not_if "yay -Q #{params[:name]}"
  end
end

git File.expand_path('/tmp/yay') do
  repository 'https://aur.archlinux.org/yay.git'
  not_if 'which yay'
end

execute 'makepkg -si' do
  cwd '/tmp/yay'
  not_if 'which yay'
end

include_recipe 'recipes/yay.rb'

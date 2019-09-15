brew_command = '/home/linuxbrew/.linuxbrew/bin/brew'

define :tap do
  user, repository = params[:name].split('/')

  execute "#{brew_command} tap #{params[:name]}" do
    user node[:user]
    not_if "test -d /home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/#{user}/homebrew-#{repository}"
  end
end

define :brew, directory_name: nil, head: false do
  directory_name = params[:directory_name] || params[:name]
  head_option = '--HEAD' if params[:head]

  execute "#{brew_command} install #{head_option} #{params[:name]}" do
    user node[:user]
    not_if "test -d /home/linuxbrew/.linuxbrew/Cellar/#{directory_name}"
  end
end

execute 'curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh | sh' do
  user node[:user]
  not_if 'test -d /home/linuxbrew/.linuxbrew'
end

include_recipe 'recipes/tap.rb'
include_recipe 'recipes/brew.rb'

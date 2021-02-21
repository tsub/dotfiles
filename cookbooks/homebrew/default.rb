define :tap, uri: nil do
  execute "brew tap #{params[:name]} #{params[:uri]}" do
    user, repository = params[:name].split('/')
    not_if "test -d /usr/local/Homebrew/Library/Taps/#{user}/homebrew-#{repository}"
  end
end

define :brew, directory_name: nil, use_cellar_option: false, head: false do
  directory_name = params[:directory_name] || params[:name]
  head_option = '--HEAD ' if params[:head]

  execute "brew install #{head_option}#{params[:name]}" do
    if params[:use_cellar_option]
      not_if "test -d $(brew --cellar #{params[:name]})"
    else
      not_if "test -d /usr/local/Cellar/#{directory_name}"
    end
  end
end

define :cask do
  execute "brew install --cask #{params[:name]}" do
    not_if "test -d /usr/local/Caskroom/#{params[:name]} -o -x /usr/local/bin/#{params[:name]}"
  end
end

execute '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"' do
  not_if 'which brew'
end

include_recipe 'recipes/tap.rb'
include_recipe 'recipes/brew.rb'
include_recipe 'recipes/cask.rb'

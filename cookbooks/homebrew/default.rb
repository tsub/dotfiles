define :tap do
  execute "brew tap #{params[:name]}" do
    # not_if "brew tap | grep #{params[:name]}"
    user, repository = params[:name].split('/')
    not_if "test -d /usr/local/Homebrew/Library/Taps/#{user}/homebrew-#{repository}"
  end
end

define :brew do
  execute "brew install #{params[:name]}" do
    not_if "test -d /usr/local/Cellar/#{params[:name]}"
  end
end

define :cask do
  execute "brew cask install #{params[:name]}" do
    not_if "test -d /usr/local/Caskroom/#{params[:name]}"
  end
end

execute '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"' do
  not_if 'which brew'
end

include_recipe 'recipes/tap.rb'
include_recipe 'recipes/brew.rb'
include_recipe 'recipes/cask.rb'
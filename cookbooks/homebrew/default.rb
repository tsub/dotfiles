arch = run_command('uname -m').stdout.strip # workaround: node['kernel'] return nil when Darwin
homebrew_dir = case arch
               when 'amd64' then '/usr/local'
               when 'arm64' then '/opt/homebrew'
               end

define :tap, uri: nil do
  execute "brew tap #{params[:name]} #{params[:uri]}" do
    user, repository = params[:name].split('/')

    not_if "test -d #{homebrew_dir}/Library/Taps/#{user}/homebrew-#{repository}"
  end
end

define :brew, directory_name: nil, use_cellar_option: false, head: false, start_service: false do
  directory_name = params[:directory_name] || params[:name]
  head_option = '--HEAD ' if params[:head]

  execute "brew install #{head_option}#{params[:name]}" do
    if params[:use_cellar_option]
      not_if "test -d $(brew --cellar #{params[:name]})"
    else
      not_if "test -d #{homebrew_dir}/Cellar/#{directory_name}"
    end
  end

  if params[:start_service]
    execute "brew services start #{params[:name]}" do
      not_if "brew services info --json #{params[:name]} | grep '\"running\": true'"
    end
  end
end

define :cask do
  execute "brew install --cask #{params[:name]}" do
    not_if "test -d #{homebrew_dir}/Caskroom/#{params[:name]} -o -x /opt/homebrew/bin/#{params[:name]}"
  end
end

execute '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"' do
  not_if "test -x #{homebrew_dir}/bin/brew"
end

include_recipe 'recipes/tap.rb'
include_recipe 'recipes/brew.rb'
include_recipe 'recipes/cask.rb'

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

define :brew, directory_name: nil, use_cellar_option: false, head: false, start_service: false, tap_name: nil do
  directory_name = params[:directory_name] || params[:name]
  head_option = '--HEAD ' if params[:head]
  package_name = params[:tap_name] ? "#{params[:tap_name]}/#{params[:name]}" : params[:name]

  execute "brew install --formula #{head_option}#{package_name}" do
    if params[:use_cellar_option]
      not_if "test -d $(brew --cellar #{package_name})"
    else
      not_if "test -d #{homebrew_dir}/Cellar/#{directory_name}"
    end
  end

  if params[:start_service]
    execute "brew services start #{package_name}" do
      not_if "brew services info --json #{package_name} | grep '\"running\": true'"
    end
  end
end

define :cask, tap_name: nil do
  directory_name = params[:name]
  package_name = params[:tap_name] ? "#{params[:tap_name]}/#{params[:name]}" : params[:name]

  execute "brew install --cask #{package_name}" do
    not_if "test -d #{homebrew_dir}/Caskroom/#{directory_name} -o -x /opt/homebrew/bin/#{directory_name}"
  end
end

execute '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"' do
  not_if "test -x #{homebrew_dir}/bin/brew"
end

include_recipe 'recipes/tap.rb'
include_recipe 'recipes/brew.rb'
include_recipe 'recipes/cask.rb'

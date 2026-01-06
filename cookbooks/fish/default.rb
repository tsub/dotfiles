## fish

arch = run_command('uname -m').stdout.strip.sub('aarch64', 'arm64') # workaround: node['kernel'] return nil when Darwin
homebrew_dir = case arch
               when 'amd64' then '/usr/local'
               when 'arm64' then '/opt/homebrew'
               end
fish_path = node[:platform] == 'darwin' ? homebrew_dir + '/bin/fish' : '/usr/bin/fish'

if node[:platform] == 'debian'
  debian_version = '12'
  fish_version = '4.2.1-1'
  fish_major_version = fish_version.split('.').first

  execute "curl -fSL -o #{Dir.tmpdir}/fish.deb https://download.opensuse.org/repositories/shells:/fish:/release:/#{fish_major_version}/Debian_#{debian_version}/#{arch}/fish_#{fish_version}_#{arch}.deb" do
    not_if 'which fish'
    user node[:user]
  end

  execute "dpkg -i #{Dir.tmpdir}/fish.deb" do
    not_if 'which fish'
  end
else
  package 'fish'
end

directory node[:fish][:home] do
  user node[:user]
end

execute "echo #{fish_path} | sudo tee -a /etc/shells" do
  not_if "grep #{fish_path} /etc/shells"
end

if node[:platform] == 'darwin'
  execute "chsh -s #{fish_path} #{node[:user]}" do
    not_if { `dscl localhost -read Local/Default/Users/#{node[:user]} UserShell`.include?(fish_path) }
  end
else
  execute "chsh -s #{fish_path} #{node[:user]}" do
    not_if { `grep #{node[:user]} /etc/passwd`.include?(fish_path) }
  end
end

directory "#{node[:fish][:home]}/conf.d" do
  user node[:user]
end

%w[basic.fish tools.fish aliases.fish].each do |config_file|
  link File.expand_path("~/.config/fish/conf.d/#{config_file}") do
    to File.expand_path("../files/.config/fish/conf.d/#{config_file}", __FILE__)
    user node[:user]
    force true
  end
end

directory "#{node[:fish][:home]}/completions" do
  user node[:user]
end

%w[alacritty aws awslocal git].each do |completion_file|
  link File.expand_path("~/.config/fish/completions/#{completion_file}.fish") do
    to File.expand_path("../files/.config/fish/completions/#{completion_file}.fish", __FILE__)
    user node[:user]
    force true
  end
end

## fisher

directory "#{node[:fish][:home]}/functions" do
  user node[:user]
end

execute "#{fish_path} -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish -o ~/.config/fish/functions/fisher.fish'" do
  not_if 'test -f ~/.config/fish/functions/fisher.fish'
  user node[:user]
end

link File.expand_path('~/.config/fish/fish_plugins') do
  to File.expand_path('../files/.config/fish/fish_plugins', __FILE__)
  user node[:user]
  force true
end

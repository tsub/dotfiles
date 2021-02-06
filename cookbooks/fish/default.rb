## fish

fish_path = node[:platform] == 'darwin' ? '/usr/local/bin/fish' : '/usr/bin/fish'

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

link File.expand_path('~/.config/fish/config.fish') do
  to File.expand_path('../files/.config/fish/config.fish', __FILE__)
  user node[:user]
  force true
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

%w[hub alacritty aws].each do |completion_file|
  link File.expand_path("~/.config/fish/completions/#{completion_file}.fish") do
    to File.expand_path("../files/.config/fish/completions/#{completion_file}.fish", __FILE__)
    user node[:user]
    force true
  end
end

if node[:platform] == 'darwin'
  %w[docker docker-compose].each do |completion_file|
    link File.expand_path("~/.config/fish/completions/#{completion_file}.fish") do
      to "/Applications/Docker.app/Contents/Resources/etc/#{completion_file}.fish-completion"
      user node[:user]
      force true
    end
  end
end

## fisherman

execute 'curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher' do
  not_if { 'test -f ~/.config/fish/functions/fisher.fish' }
end

link File.expand_path('~/.config/fish/fish_plugins') do
  to File.expand_path('../files/.config/fish/fish_plugins', __FILE__)
  user node[:user]
  force true
end

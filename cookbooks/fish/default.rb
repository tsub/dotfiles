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
end

%w[basic.fish tools.fish aliases.fish].each do |config_file|
  link File.expand_path("~/.config/fish/conf.d/#{config_file}") do
    to File.expand_path("../files/.config/fish/conf.d/#{config_file}", __FILE__)
    user node[:user]
  end
end

directory "#{node[:fish][:home]}/completions" do
  user node[:user]
end

%w[hub.fish kubectx.fish kubens.fish alacritty.fish].each do |completion_file|
  link File.expand_path("~/.config/fish/completions/#{completion_file}") do
    to File.expand_path("../files/.config/fish/completions/#{completion_file}", __FILE__)
    user node[:user]
  end
end

## fisherman

link File.expand_path('~/.config/fish/fishfile') do
  to File.expand_path('../files/.config/fish/fishfile', __FILE__)
  user node[:user]
end

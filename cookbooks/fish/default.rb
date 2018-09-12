## fish

fish_path = node[:platform] == 'darwin' ? '/usr/local/bin/fish' : '/usr/bin/fish'

directory node[:fish][:home]

if node[:platform] == 'darwin'
  execute "echo #{fish_path} | sudo tee -a /etc/shells" do
    not_if 'echo $SHELL | grep fish'
  end
end

execute "chsh -s #{fish_path} #{ENV['SUDO_USER'] || ENV['USER']}" do
  not_if 'echo $SHELL | grep fish'
end

directory "#{node[:fish][:home]}/conf.d"

link File.expand_path('~/.config/fish/config.fish') do
  to File.expand_path('../files/.config/fish/config.fish', __FILE__)
end

%w[basic.fish tools.fish aliases.fish].each do |config_file|
  link File.expand_path("~/.config/fish/conf.d/#{config_file}") do
    to File.expand_path("../files/.config/fish/conf.d/#{config_file}", __FILE__)
  end
end

directory "#{node[:fish][:home]}/completions"

%w[hub.fish kubectx.fish kubens.fish alacritty.fish].each do |completion_file|
  link File.expand_path("~/.config/fish/completions/#{completion_file}") do
    to File.expand_path("../files/.config/fish/completions/#{completion_file}", __FILE__)
  end
end

## fisherman

link File.expand_path('~/.config/fish/fishfile') do
  to File.expand_path('../files/.config/fish/fishfile', __FILE__)
end

package 'fish'
package 'fisherman/tap/fisherman'

## fish

directory node[:fish][:home]

if node[:platform] == 'darwin'
  execute 'echo /usr/local/bin/fish | sudo tee -a /etc/shells' do
    not_if 'echo $SHELL | grep fish'
  end

  execute 'chsh -s /usr/local/bin/fish' do
    not_if 'echo $SHELL | grep fish'
  end
end

directory "#{node[:fish][:home]}/conf.d"

%w(basic.fish tools.fish aliases.fish).each do |config_file|
  link File.expand_path("~/.config/fish/conf.d/#{config_file}") do
    to File.expand_path("../files/.config/fish/conf.d/#{config_file}", __FILE__)
  end
end

## fisherman

link File.expand_path('~/.config/fish/fishfile') do
  to File.expand_path('../files/.config/fish/fishfile', __FILE__)
end

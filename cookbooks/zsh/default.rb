package 'zsh'
package 'zplug'

link File.expand_path('~/.zshrc') do
  to File.expand_path('../files/.zshrc', __FILE__)
end

link File.expand_path('~/.zsh') do
  to File.expand_path('../files/.zsh', __FILE__)
end

if node[:platform] == 'darwin'
  execute 'chsh -s /usr/local/bin/zsh' do
    not_if 'echo $SHELL | grep zsh'
  end
end

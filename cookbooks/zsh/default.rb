package 'zsh'
package 'zplug'

link "#{node[:home]}/.zshrc" do
  to File.expand_path('../files/.zshrc', __FILE__)
end

link "#{node[:home]}/.zsh" do
  to File.expand_path('../files/.zsh', __FILE__)
end

if node[:platform] == 'darwin'
  execute 'chsh -s /usr/local/bin/zsh' do
    not_if 'echo $SHELL | grep zsh'
  end
end

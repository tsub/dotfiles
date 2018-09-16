link File.expand_path('~/.tmux.conf') do
  to File.expand_path('../files/.tmux.conf', __FILE__)
  user node[:user]
end

directory File.expand_path('~/.tmux/plugins') do
  user node[:user]
end

git File.expand_path('~/.tmux/plugins/tpm') do
  repository 'https://github.com/tmux-plugins/tpm.git'
  user node[:user]
end

execute File.expand_path('~/.tmux/plugins/tpm/bin/install_plugins') do
  not_if 'test -d ~/.tmux/plugins/tmux-prefix-highlight'
  user node[:user]
end

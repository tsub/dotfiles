anyenv 'rbenv'

rbenv '2.4.0' do
  binary "#{node[:home]}/.anyenv/envs/rbenv/bin/rbenv"
end

link "#{node[:home]}/.gemrc" do
  to File.expand_path('../../files/.gemrc', __FILE__)
end

link "#{node[:home]}/.bundle" do
  to File.expand_path('../../files/.bundle', __FILE__)
end

git "#{node[:home]}/.anyenv/envs/rbenv/plugins/rbenv-default-gems" do
  repository 'https://github.com/rbenv/rbenv-default-gems.git'
end

link "#{node[:home]}/.anyenv/envs/rbenv/default-gems" do
  to File.expand_path('../../files/.anyenv/envs/rbenv/default-gems', __FILE__)
end

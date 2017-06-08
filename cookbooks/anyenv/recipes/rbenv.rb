anyenv 'rbenv'

rbenv '2.4.1' do
  binary File.expand_path('~/.anyenv/envs/rbenv/bin/rbenv')
end

link File.expand_path('~/.gemrc') do
  to File.expand_path('../../files/.gemrc', __FILE__)
end

link File.expand_path('~/.bundle') do
  to File.expand_path('../../files/.bundle', __FILE__)
end

git File.expand_path('~/.anyenv/envs/rbenv/plugins/rbenv-default-gems') do
  repository 'https://github.com/rbenv/rbenv-default-gems.git'
end

link File.expand_path('~/.anyenv/envs/rbenv/default-gems') do
  to File.expand_path('../../files/.anyenv/envs/rbenv/default-gems', __FILE__)
end

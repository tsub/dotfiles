git File.expand_path('~/ghq/src/github.com/tsub/autoForward') do
  repository 'https://github.com/tsub/autoForward.git'
  user node[:user]
end

link File.expand_path('~/Library/LaunchAgents/autoforward.plist') do
  to File.expand_path('../files/autoforward.plist', __FILE__)
  user node[:user]
  force true
end

execute 'launchctl load ~/Library/LaunchAgents/autoforward.plist' do
  user node[:user]
  not_if 'launchctl list | grep autoforward'
end

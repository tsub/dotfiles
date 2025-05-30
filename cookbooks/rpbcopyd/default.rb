rpbcopyd_path = File.expand_path('~/.bin/rpbcopyd')

directory File.expand_path('~/.bin') do
  user node[:user]
end

execute "curl -fsSL -o #{rpbcopyd_path} https://github.com/tk0miya/rpbcopyd/releases/download/v1.0.0/rpbcopyd-v1.0.0-aarch64-apple-darwin" do
  not_if "test -f #{rpbcopyd_path}"
  user node[:user]
end

file rpbcopyd_path do
  mode '0755'
end

execute "#{rpbcopyd_path} -d -H 127.0.0.1" do
  not_if 'pgrep -fq rpbcopyd'
  user node[:user]
end

os = node[:platform] == 'darwin' ? 'darwin' : 'linux'
arch = run_command('uname -m').stdout.strip.sub('aarch64', 'arm') # workaround: node['kernel'] return nil when Darwin

url = "https://github.com/mrjosh/helm-ls/releases/download/master/helm_ls_#{os}_#{arch}"
puts url

execute "curl -fSL -o /usr/local/bin/helm-ls #{url}" do
  not_if 'test -x /usr/local/bin/helm-ls'
end

file '/usr/local/bin/helm-ls' do
  mode '0755'
end

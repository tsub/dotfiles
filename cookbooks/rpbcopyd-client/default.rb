rpbcopy_path = File.expand_path('/usr/local/bin/pbcopy')
rpbpaste_path = File.expand_path('/usr/local/biin/pbpaste')

execute "curl -fsSL -o #{rpbcopy_path} https://github.com/tk0miya/rpbcopyd/releases/download/v1.0.0/rpbcopy-v1.0.0-aarch64-unknown-linux-musl" do
  not_if "test -f #{rpbcopy_path}"
end

file rpbcopy_path do
  mode '0755'
end

execute "curl -fsSL -o #{rpbpaste_path} https://github.com/tk0miya/rpbcopyd/releases/download/v1.0.0/rpbpaste-v1.0.0-aarch64-unknown-linux-musl" do
  not_if "test -f #{rpbpaste_path}"
end

file rpbpaste_path do
  mode '0755'
end

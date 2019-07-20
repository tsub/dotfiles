asdf 'nodejs' do
  version node[:asdf_global_version][:nodejs]
end

asdf 'ruby' do
  version node[:asdf_global_version][:ruby]
end

asdf 'terraform' do
  version node[:asdf_global_version][:terraform]
end

asdf 'golang' do
  version node[:asdf_global_version][:golang]
end

package 'peco'

link "#{node[:home]}/.peco" do
  to File.expand_path('../files/.peco', __FILE__)
end

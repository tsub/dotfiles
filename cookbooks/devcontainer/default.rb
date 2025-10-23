directory File.expand_path('~/.local/bin') do
  user node[:user]
end

%w[dev].each do |script_name|
  link File.expand_path("~/.local/bin/#{script_name}") do
    to File.expand_path("../files/#{script_name}", __FILE__)
    user node[:user]
    force true
  end
end

directory File.expand_path('~/.local/bin') do
  user node[:user]
end

%w[auto-aws-sso-login.sh aws-get-secret aws-ssm-get-parameter aws-ssm-start-session].each do |script_name|
  link File.expand_path("~/.local/bin/#{script_name}") do
    to File.expand_path("../files/#{script_name}", __FILE__)
    user node[:user]
    force true
  end
end

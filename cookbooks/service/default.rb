remote_file File.expand_path('/etc/systemd/system/powertop.service') do
  source File.expand_path('../files/powertop.service', __FILE__)
  mode '0644'
end

%w[tlp docker lenovo_fix acpid powertop].each do |s|
  service s do
    action [:enable, :start]
  end
end

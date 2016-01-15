directory "/etc/syslog-ng/cert.d" do
  action :create
  mode "0644"
  owner "root"
end

execute "extract_ca_bundle" do
  command "tar xzvf /tmp/papertrail-bundle.tar.gz"
  cwd "/etc/syslog-ng/cert.d"
  action :nothing
end

remote_file "/tmp/papertrail-bundle.tar.gz" do
  source node["syslog-ng"]["papertrail"]["ca_bundle"]
  checksum node["syslog-ng"]["papertrail"]["ca_bundle_checksum"]
  mode 0644
  notifies :run, "execute[extract_ca_bundle]"
end

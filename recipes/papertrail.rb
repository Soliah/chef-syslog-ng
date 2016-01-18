directory "/etc/syslog-ng/cert.d" do
  action :create
  mode "0755"
  owner "root"
  group "root"
end.run_action(:create)

remote_file "/tmp/papertrail-bundle.tar.gz" do
  source node["syslog-ng"]["papertrail"]["ca_bundle"]
  checksum node["syslog-ng"]["papertrail"]["ca_bundle_checksum"]
  mode "0644"
  owner "root"
  group "root"
  action :create_if_missing
end.run_action(:create)

execute "extract_ca_bundle" do
  command "tar xzvf /tmp/papertrail-bundle.tar.gz"
  cwd "/etc/syslog-ng/cert.d"
  action :run
  only_if { Dir["/etc/syslog-ng/cert.d/*"].empty? }
end.run_action(:run)

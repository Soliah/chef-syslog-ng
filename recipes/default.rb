extend SyslogNg

# Work around for https://bugs.launchpad.net/ubuntu/+source/syslog-ng/+bug/1242173
%w(syslog-ng-core syslog-ng).each do |pkg|
  package(pkg) do
    action :install
  end.run_action(:install)
end

# Make sure to remove rsyslog
%w(rsyslog-gnutls rsyslog).each do |pkg|
  package pkg do
    action :remove
  end.run_action(:remove)
end

@svc = service "syslog-ng" do
  supports status: true, start: true, stop: true, restart: true, reload: true
  provider Chef::Provider::Service::Init::Debian
  action :enable
end

@svc.run_action(:enable)

template "/etc/syslog-ng/syslog-ng.conf" do
  mode "0644"
  owner "root"
  source "syslog-ng.conf.erb"
  notifies :restart, "service[syslog-ng]", :immediately
end.run_action(:create)

@svc.run_action(:start)

include_recipe "syslog-ng::papertrail" if node["syslog-ng"]["papertrail"]["install_ca_bundle"]

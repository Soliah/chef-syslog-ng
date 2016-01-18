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

declare_syslog_ng_service [:enable, :start]

template "/etc/syslog-ng/syslog-ng.conf" do
  mode "0644"
  owner "root"
  source "syslog-ng.conf.erb"
  notifies :restart, "service[syslog-ng]"
end.run_action(:create)

include_recipe "syslog-ng::papertrail" if node["syslog-ng"]["papertrail"]["install_ca_bundle"]

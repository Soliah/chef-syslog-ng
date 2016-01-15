extend SyslogNg

# Work around for https://bugs.launchpad.net/ubuntu/+source/syslog-ng/+bug/1242173
%w(syslog-ng-core syslog-ng).each do |pkg|
  package(pkg) do
    action :install
  end
end

# Make sure to remove rsyslog
%w(rsyslog-gnutls rsyslog).each do |pkg|
  package pkg do
    action :remove
  end
end

template "/etc/syslog-ng/syslog-ng.conf" do
  mode "0644"
  owner "root"
  source "syslog-ng.conf.erb"
  notifies :restart, "service[syslog-ng]"
end

declare_syslog_ng_service [:enable, :start]

include_recipe "syslog-ng::papertrail" if node["syslog-ng"]["papertrail"]["install_ca_bundle"]

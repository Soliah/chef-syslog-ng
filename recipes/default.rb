# Work around for https://bugs.launchpad.net/ubuntu/+source/syslog-ng/+bug/1242173
%w(syslog-ng-core syslog-ng).each do |pkg|
  package(pkg) do
    action :install
  end
end

template "/etc/syslog-ng/syslog-ng.conf" do
  mode "0644"
  owner "root"
  source "syslog-ng.conf.erb"
  notifies :restart, "service[syslog-ng]"
end

service "syslog-ng" do
  supports status: true, start: true, stop: true, restart: true, reload: true
  provider Chef::Provider::Service::Init::Debian
  action [:enable, :start]
end

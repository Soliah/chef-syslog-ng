use_inline_resources

action :create do
  template "/etc/syslog-ng/conf.d/#{new_resource.priority}-papertrail-#{new_resource.name}.conf" do
    mode 0664
    cookbook "syslog-ng"
    source "papertrail/log_file.conf.erb"
    variables(destination: new_resource.destination, name: new_resource.name, file: new_resource.file)
  end
end

action :delete do
  template "/etc/syslog-ng/conf.d/#{new_resource.priority}-papertrail-#{new_resource.name}.conf" do
    cookbook "syslog-ng"
    action :delete
    source "papertrail/log_file.conf.erb"
  end
end

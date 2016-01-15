use_inline_resources

action :create do
  template "/etc/syslog-ng/conf.d/#{new_resource.priority}-papertrail-#{new_resource.name}.conf" do
    cookbook "syslog-ng"
    mode 0664
    source "papertrail/log_program.conf.erb"
    variables(destination: new_resource.destination, name: new_resource.name, program: new_resource.program)
  end
end

action :delete do
  template "/etc/syslog-ng/conf.d/#{new_resource.priority}-papertrail-#{new_resource.name}.conf" do
    cookbook "syslog-ng"
    action :delete
    source "papertrail/log_tag.conf.erb"
  end
end

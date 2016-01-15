use_inline_resources

action :create do
  tags = new_resource.tags.map { |t| "\"#{t}\"" }.join(", ")

  template "/etc/syslog-ng/conf.d/#{new_resource.priority}-papertrail-#{new_resource.name}.conf" do
    cookbook "syslog-ng"
    mode 0664
    source "papertrail/log_tag.conf.erb"
    variables(destination: new_resource.destination, name: new_resource.name, tags: tags)
  end
end

action :delete do
  template "/etc/syslog-ng/conf.d/#{new_resource.priority}-papertrail-#{new_resource.name}.conf" do
    cookbook "syslog-ng"
    action :delete
    source "papertrail/log_tag.conf.erb"
  end
end

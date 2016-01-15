use_inline_resources

action :create do
  file "/etc/syslog-ng/conf.d/#{new_resource.priority}-papertrail-#{new_resource.name}-destination.conf" do
    mode 0664
    content <<-EOS
destination d_#{new_resource.name} {
  tcp("#{new_resource.host}.papertrailapp.com" port(#{new_resource.port}) tls(peer-verify(optional-untrusted) ca_dir("/etc/syslog-ng/cert.d")) );
};
    EOS
  end
end

action :delete do
  file "/etc/syslog-ng/conf.d/#{new_resource.priority}-papertrail-#{new_resource.name}-destination.conf" do
    action :delete
  end
end

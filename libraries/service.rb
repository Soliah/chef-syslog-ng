module SyslogNg
  def declare_syslog_ng_service(actions = :nothing)
    service "syslog-ng" do
      supports status: true, start: true, stop: true, restart: true, reload: true
      provider Chef::Provider::Service::Init::Debian
      action actions
    end.run_action(:start)
  end
end

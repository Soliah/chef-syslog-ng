require "serverspec"

set :backend, :exec

describe "syslog-ng::default" do
  describe package("syslog-ng") do
    it { is_expected.to be_installed }
  end

  describe file("/etc/syslog-ng/syslog-ng.conf") do
    it { should be_a_file }
    it { should be_mode(644) }
  end

  describe service("syslog-ng") do
    it { should be_enabled }
    it { should be_running }
  end
end

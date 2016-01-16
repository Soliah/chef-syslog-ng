require "serverspec"

set :backend, :exec

describe "syslog-ng::papertrail" do
  describe file("/etc/syslog-ng/cert.d") do
    it { is_expected.to exist }
    it { is_expected.to be_a_directory }
    it { should be_mode(755) }
  end

  describe file("/etc/syslog-ng/cert.d/0b759015.0") do
    it { is_expected.to exist }
    it { is_expected.to be_a_file }
  end
end

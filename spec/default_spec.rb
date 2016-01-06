require "spec_helper"

describe "syslog-ng::default" do
  let(:chef_run) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it "installs syslog-ng" do
    expect(chef_run).to install_package("syslog-ng")
  end

  it "enables syslog-ng service" do
    expect(chef_run).to enable_service("syslog-ng")
  end

  it "starts syslog-ng service" do
    expect(chef_run).to start_service("syslog-ng")
  end

  it "renders syslog-ng.conf template" do
    expect(chef_run).to render_file("/etc/syslog-ng/syslog-ng.conf")
  end
end

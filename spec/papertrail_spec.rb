require "spec_helper"

describe "syslog-ng::papertrail" do
  let(:chef_run) do
    ChefSpec::SoloRunner.new.converge(described_recipe)
  end

  it "creates ca directory with correct permissions" do
    expect(chef_run).to create_directory("/etc/syslog-ng/cert.d").with(
      owner: "root",
      group: "root",
      mode:  "0755"
    )
  end

  it "downloads the CA bundle" do
    expect(chef_run).to create_remote_file_if_missing("/tmp/papertrail-bundle.tar.gz")
    file = chef_run.remote_file("/tmp/papertrail-bundle.tar.gz")
    expect(file).to notify("execute[extract_ca_bundle]").to(:run)
  end
end

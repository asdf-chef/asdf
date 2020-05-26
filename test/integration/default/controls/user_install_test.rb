control "user-install" do
  title "user_install resource"
  desc "Ensure user_install resource is installed."
  impact 1.0

  describe bash('sudo -H -u vagrant bash -c "source /etc/profile.d/asdf.sh && which asdf"') do
    its("exit_status") { should eq 0 }
  end

  describe file("/etc/profile.d/asdf.sh") do
    it { should exist }
    it { should be_file }
    its("owner") { should eq "root" }
  end

  describe directory("/home/vagrant/.asdf/installs") do
    it { should exist }
    it { should be_directory }
    its("owner") { should eq "vagrant" }
  end

  describe directory("/home/vagrant/.asdf/plugins") do
    it { should exist }
    it { should be_directory }
    its("owner") { should eq "vagrant" }
  end

  describe directory("/home/vagrant/.asdf/shims") do
    it { should exist }
    it { should be_directory }
    its("owner") { should eq "vagrant" }
  end

  describe file("/home/vagrant/.asdfrc") do
    it { should exist }
    it { should be_file }
    its("owner") { should eq "vagrant" }
    its("content") { should eq "legacy_version_file = no" }
  end
end

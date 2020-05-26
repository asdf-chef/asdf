control "script" do
  title "script resource"
  desc "Ensure script resource is installed."
  impact 1.0

  describe bash('sudo -H -u vagrant bash -c "source /etc/profile.d/asdf.sh && asdf update"') do
    its("exit_status") { should eq 0 }
  end
end

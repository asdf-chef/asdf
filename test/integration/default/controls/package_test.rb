control 'package' do
  title 'package resource'
  desc 'Ensure package resource is installed.'
  impact 1.0

  describe bash('sudo -H -u vagrant bash -c "source /etc/profile.d/asdf.sh && asdf list ruby"') do
    its('stdout') { should include('2.6.3') }
    its('exit_status') { should eq 0 }
  end

  describe file('/home/vagrant/.tool-versions') do
    its('content') { should include('ruby 2.6.3') }
  end
end

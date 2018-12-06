control 'asdf_package' do
  title 'Installs, uninstalls and sets global asdf packages'

  desc 'Installs ruby 2.5.1'
  describe bash('sudo -H -u vagrant bash -c "source /etc/profile.d/asdf.sh && asdf list ruby"') do
    its('stdout') { should include('2.5.1') }
    its('exit_status') { should eq 0 }
  end

  desc 'Sets ruby 2.5.1 to global'
  describe file('/home/vagrant/.tool-versions') do
    its('content') { should include('ruby 2.5.1') }
  end

  desc 'Sets default gems'
  describe file('/home/vagrant/.default-gems') do
    it { should exist }
    it { should be_file }
    its('owner') { should eq 'vagrant' }
    its('group') { should eq 'vagrant' }
    its('content') { should include 'bundler' }
  end
end

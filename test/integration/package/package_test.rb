# # encoding: utf-8
#
# Inspec test for test::package

describe bash('sudo -H -u vagrant bash -c "source /etc/profile.d/asdf.sh && asdf list ruby"') do
  its('stdout') { should include('2.5.1') }
  its('exit_status') { should eq 0 }
end

describe file('/home/vagrant/.tool-versions') do
  its('content') { should include('ruby 2.5.1') }
end

describe file('/home/vagrant/.default-gems') do
  it { should exist }
  it { should be_file }
  its('owner') { should eq 'vagrant' }
  its('group') { should eq 'vagrant' }
  its('content') { should include 'bundler' }
end

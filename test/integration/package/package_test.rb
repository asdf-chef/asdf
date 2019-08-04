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

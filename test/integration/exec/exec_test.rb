# # encoding: utf-8
#
# Inspec test for test::package

describe bash('sudo -H -u vagrant bash -c "source /etc/profile.d/asdf.sh && asdf exec gem list pry"') do
  its('stdout') { should include('pry') }
  its('exit_status') { should eq 0 }
end

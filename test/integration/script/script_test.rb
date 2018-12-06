# # encoding: utf-8
#
# Inspec test for test::script

describe bash('sudo -H -u vagrant bash -c "source /etc/profile.d/asdf.sh && asdf plugin-list"') do
  its('stdout') { should include('ruby') }
end

describe bash('sudo -H -u vagrant bash -c "source /etc/profile.d/asdf.sh && asdf plugin-list"') do
  its('stdout') { should include('golang') }
end

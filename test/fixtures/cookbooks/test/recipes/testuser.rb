group 'testuser'

user 'testuser' do
  gid 'testuser'
  shell '/bin/bash'
  manage_home true
end

file '/etc/sudoers.d/testuser' do
  content 'testuser ALL=(ALL) NOPASSWD:ALL'
  owner 'root'
  group 'root'
end

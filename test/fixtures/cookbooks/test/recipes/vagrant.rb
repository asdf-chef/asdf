group 'vagrant'

user 'vagrant' do
  gid 'vagrant'
  shell '/bin/bash'
  manage_home true
end

file '/etc/sudoers.d/vagrant' do
  content 'vagrant ALL=(ALL) NOPASSWD:ALL'
  owner 'root'
  group 'root'
end

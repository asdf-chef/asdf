user "testuser" do
  shell "/bin/bash"
end

group "testuser" do
  members "testuser"
end

directory "/home/testuser" do
  owner "testuser"
  group "testuser"
end

file "/etc/sudoers.d/testuser" do
  content "testuser ALL=(ALL) NOPASSWD:ALL"
  owner "root"
  group "root"
end

# frozen_string_literal: true

user 'vagrant'

group 'vagrant' do
  members 'vagrant'
end

directory '/home/vagrant' do
  owner 'vagrant'
  group 'vagrant'
end

file '/etc/sudoers.d/vagrant' do
  content 'vagrant ALL=(ALL) NOPASSWD:ALL'
  owner 'root'
  group 'root'
end

# frozen_string_literal: true

apt_update 'update'

asdf_package 'nodejs' do
  user 'vagrant'
  version '10.12.0'
  live_stream true
  action [:install, :global]
end

asdf_package 'ruby' do
  user 'vagrant'
  version '2.5.1'
  live_stream true
  action [:install, :global]
end

asdf_package 'php' do
  user 'vagrant'
  version '7.2.11'
  live_stream true
  action [:install, :global]
end

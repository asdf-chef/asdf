# frozen_string_literal: true

asdf_package 'nodejs' do
  user 'vagrant'
  version '8.7.0'
  live_stream true
  action [:install, :global]
end

asdf_package 'ruby' do
  user 'vagrant'
  version '2.4.2'
  live_stream true
  action [:install, :global]
end

asdf_package 'php' do
  user 'vagrant'
  version '5.6.32'
  live_stream true
  action [:install, :global]
end

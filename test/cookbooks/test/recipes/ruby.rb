# frozen_string_literal: true

include_recipe 'test::asdf_user_install'

asdf_plugin 'ruby' do
  user 'vagrant'
end

asdf_package 'ruby' do
  user 'vagrant'
  version '2.5.1'
  live_stream true
  action [:install, :global]
end

asdf_package 'ruby' do
  user 'vagrant'
  version '2.4.4'
  live_stream true
  action [:install]
end

asdf_package 'ruby' do
  user 'vagrant'
  version '2.3.7'
  live_stream true
  action [:install]
end

asdf_package 'ruby' do
  user 'vagrant'
  version '2.2.10'
  live_stream true
  action [:install]
end

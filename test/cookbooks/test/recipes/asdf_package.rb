# frozen_string_literal: true

asdf_package 'ruby' do
  user 'vagrant'
  version '2.5.1'
  live_stream true
  action [:install, :global]
end

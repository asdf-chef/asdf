# frozen_string_literal: true

apt_update 'update'

asdf_script 'asdf version' do
  user 'vagrant'
  code %(asdf current)
  live_stream true
end

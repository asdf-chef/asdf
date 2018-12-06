asdf_script 'asdf version' do
  user 'vagrant'
  code %(asdf current)
  live_stream true
end

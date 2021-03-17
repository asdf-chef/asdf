require 'spec_helper'

describe 'asdf_script' do
  platform 'ubuntu'

  step_into :asdf_script

  recipe do
    user 'vagrant'

    asdf_script 'update' do
      user 'vagrant'
    end
  end

  it do
    is_expected.to run_execute('update')
      .with_command('asdf update')
      .with_cwd('/home/vagrant')
      .with_group('vagrant')
      .with_live_stream(true)
      .with_returns([0])
      .with_timeout(3600)
      .with_user('vagrant')
  end
end

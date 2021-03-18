require 'spec_helper'

describe 'asdf_script' do
  platform 'ubuntu'

  step_into :asdf_script

  recipe do
    user 'vagrant'

    asdf_script 'asdf update' do
      user 'vagrant'
    end
  end

  it do
    is_expected.to run_bash('asdf update')
      .with_cwd('/home/vagrant')
      .with_group('vagrant')
      .with_live_stream(true)
      .with_returns([0])
      .with_timeout(3600)
      .with_user('vagrant')
      .with_code <<~CODE
        export ASDF_PATH="/home/vagrant/.asdf"
        export PATH="${ASDF_PATH}/shims:${ASDF_PATH}/bin:$PATH"
        . /etc/profile.d/asdf.sh
        asdf update
      CODE
  end
end

require 'spec_helper'

describe 'asdf_script' do
  platform 'ubuntu'

  step_into :asdf_script

  recipe do
    asdf_script 'update'
  end

  before do
    allow(File).to receive(:expand_path).and_call_original
    allow(File).to receive(:expand_path).with('~vagrant').and_return('/home/vagrant')
  end

  it do
    is_expected.to run_bash('update')
      .with_cwd('/home/vagrant')
      .with_group('vagrant')
      .with_live_stream(true)
      .with_returns([0])
      .with_timeout(3600)
      .with_user('vagrant')
      .with_code <<~EOF
        export PATH="/shims:/bin:$PATH"
        source /etc/profile.d/asdf.sh
        asdf update
      EOF
  end
end

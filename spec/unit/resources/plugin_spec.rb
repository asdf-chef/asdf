require 'spec_helper'

describe 'asdf_plugin' do
  platform 'ubuntu'

  step_into :asdf_plugin

  recipe do
    asdf_plugin 'ruby'
  end

  before do
    allow(Dir).to receive(:exist?).and_call_original
    allow(Dir).to receive(:exist?).with('/home/vagrant/.asdf/plugins/ruby').and_return(false)
  end

  it { is_expected.to run_asdf_script('plugin add ruby') }
end

require 'spec_helper'

describe 'asdf_package' do
  platform 'ubuntu'

  step_into :asdf_package

  recipe do
    user 'vagrant'

    asdf_package 'ruby' do
      version '3.0.0'
      user 'vagrant'
    end
  end

  it { is_expected.to run_asdf_script('install ruby 3.0.0') }
end

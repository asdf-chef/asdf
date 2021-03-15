require 'spec_helper'

describe 'asdf_exec' do
  platform 'ubuntu'

  step_into :asdf_exec

  recipe do
    asdf_exec 'gem install pry'
  end

  it do
    is_expected.to run_asdf_script('exec gem install pry')
      .with_live_stream(true)
  end
end

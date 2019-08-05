require 'spec_helper'

describe 'asdf_exec' do
  step_into :asdf_exec
  platform 'ubuntu'

  context 'with default properties' do
    recipe do
      asdf_exec 'gem install pry'
    end

    it do
      is_expected.to run_asdf_script('exec gem install pry')
        .with_live_stream(true)
    end
  end
end

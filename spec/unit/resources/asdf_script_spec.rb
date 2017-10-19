# frozen_string_literal: true

require 'spec_helper'

describe 'test::asdf_script' do
  let(:ubuntu_1404) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe) }
  let(:ubuntu_1604) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  context 'using ubuntu 14.04' do
    it 'runs asdf_script to check asdf version' do
      expect(ubuntu_1404).to run_asdf_script('asdf version')
    end
  end

  context 'using ubuntu 16.04' do
    it 'runs asdf_script to check asdf version' do
      expect(ubuntu_1604).to run_asdf_script('asdf version')
    end
  end
end

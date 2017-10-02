# frozen_string_literal: true

require 'spec_helper'

describe 'asdf::default' do
  let(:ubuntu_1404) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe) }
  let(:ubuntu_1604) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  context 'using ubuntu 14.04' do
  end

  context 'using ubuntu 16.04' do
  end
end

# frozen_string_literal: true

require 'spec_helper'

describe 'test::asdf_package' do
  let(:ubuntu_1404) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe) }
  let(:ubuntu_1604) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  context 'using ubuntu 14.04' do
    it 'installs nodejs package' do
      expect(ubuntu_1404).to install_asdf_package('nodejs')
    end

    it 'installs ruby package' do
      expect(ubuntu_1404).to install_asdf_package('ruby')
    end
  end

  context 'using ubuntu 16.04' do
    it 'installs nodejs package' do
      expect(ubuntu_1604).to install_asdf_package('nodejs')
    end

    it 'installs ruby package' do
      expect(ubuntu_1604).to install_asdf_package('ruby')
    end
  end
end

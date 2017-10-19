# frozen_string_literal: true

require 'spec_helper'

describe 'test::asdf_user_install' do
  let(:ubuntu_1404) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe) }
  let(:ubuntu_1604) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  context 'using ubuntu 14.04' do
    it 'installs asdf to user' do
      expect(ubuntu_1404).to install_asdf_user_install('vagrant')
    end
  end

  context 'using ubuntu 16.04' do
    it 'installs asdf to user' do
      expect(ubuntu_1604).to install_asdf_user_install('vagrant')
    end
  end
end

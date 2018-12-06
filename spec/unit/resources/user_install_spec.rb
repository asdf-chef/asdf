#
# Cookbook:: asdf
# Spec:: user_install
#
# Copyright:: 2018, Fernando Aleman, All Rights Reserved.

require 'spec_helper'

describe 'test::user_install' do
  SUPPORTED_PLATFORMS.each do |platform, versions|
    versions.each do |version|
      context "Using #{platform} #{version}" do
        let(:chef_run) do
          runner = ChefSpec::ServerRunner.new(platform: platform, version: version)
          runner.converge(described_recipe)
        end

        it 'installs asdf to user' do
          expect(chef_run).to install_asdf_user_install('vagrant')
        end
      end
    end
  end
end

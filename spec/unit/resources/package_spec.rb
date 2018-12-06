#
# Cookbook:: asdf
# Spec:: package
#
# Copyright:: 2018, Fernando Aleman, All Rights Reserved.

require 'spec_helper'

describe 'test::package' do
  SUPPORTED_PLATFORMS.each do |platform, versions|
    versions.each do |version|
      context "Using #{platform} #{version}" do
        let(:chef_run) do
          runner = ChefSpec::ServerRunner.new(platform: platform, version: version)
          runner.converge(described_recipe)
        end

        it 'installs ruby package' do
          expect(chef_run).to install_asdf_package('ruby').with(
            version: '2.5.1',
            action: [:install, :global]
          )
        end
      end
    end
  end
end

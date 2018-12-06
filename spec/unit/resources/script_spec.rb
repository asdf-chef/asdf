#
# Cookbook:: asdf
# Spec:: script
#
# Copyright:: 2018, Fernando Aleman, All Rights Reserved.

require 'spec_helper'

describe 'test::script' do
  SUPPORTED_PLATFORMS.each do |platform, versions|
    versions.each do |version|
      context "Using #{platform} #{version}" do
        let(:chef_run) do
          runner = ChefSpec::ServerRunner.new(platform: platform, version: version)
          runner.converge(described_recipe)
        end

        it 'runs asdf_script to install ruby plugin' do
          expect(chef_run).to run_asdf_script('plugin-add ruby')
        end

        it 'runs asdf_script to install golang plugin' do
          expect(chef_run).to run_asdf_script('asdf plugin-add golang')
        end
      end
    end
  end
end

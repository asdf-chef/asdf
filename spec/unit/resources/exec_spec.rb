#
# Cookbook:: asdf
# Spec:: exec
#
# Copyright:: 2018, Fernando Aleman, All Rights Reserved.

require 'spec_helper'

describe 'test::exec' do
  SUPPORTED_PLATFORMS.each do |platform, versions|
    versions.each do |version|
      context "Using #{platform} #{version}" do
        let(:chef_run) do
          runner = ChefSpec::ServerRunner.new(platform: platform, version: version)
          runner.converge(described_recipe)
        end

        it 'runs asdf exec' do
          expect(chef_run).to run_asdf_exec('gem install pry')
        end
      end
    end
  end
end

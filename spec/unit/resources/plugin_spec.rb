#
# Cookbook:: asdf
# Spec:: plugin
#
# Copyright:: 2018, Fernando Aleman, All Rights Reserved.

require 'spec_helper'

describe 'test::plugin' do
  SUPPORTED_PLATFORMS.each do |platform, versions|
    versions.each do |version|
      context "Using #{platform} #{version}" do
        let(:chef_run) do
          runner = ChefSpec::ServerRunner.new(platform: platform, version: version)
          runner.converge(described_recipe)
        end

        it 'adds clojure plugin' do
          expect(chef_run).to add_asdf_plugin('clojure')
        end

        it 'removes clojure plugin' do
          expect(chef_run).to remove_asdf_plugin('clojure')
        end

        it 'adds nodejs plugin' do
          expect(chef_run).to add_asdf_plugin('nodejs')
        end

        it 'updates nodejs plugin' do
          expect(chef_run).to add_asdf_plugin('nodejs')
        end

        it 'adds ruby plugin' do
          expect(chef_run).to add_asdf_plugin('ruby')
        end
      end
    end
  end
end

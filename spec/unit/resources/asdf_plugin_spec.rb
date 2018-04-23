# frozen_string_literal: true

require 'spec_helper'

describe 'test::asdf_plugin' do
  SUPPORTED_PLATFORMS.each do |platform, versions|
    versions.each do |version|
      let(:chef_run) do
        ChefSpec::ServerRunner.new(platform: platform, version: version).converge(described_recipe)
      end

      context "using #{platform} #{version}" do
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

# frozen_string_literal: true

require 'spec_helper'

describe 'test::asdf_script' do
  SUPPORTED_PLATFORMS.each do |platform, versions|
    versions.each do |version|
      let(:chef_run) do
        ChefSpec::ServerRunner.new(platform: platform, version: version).converge(described_recipe)
      end

      context "using #{platform} #{version}" do
        it 'runs asdf_script to check asdf version' do
          expect(chef_run).to run_asdf_script('asdf version')
        end
      end
    end
  end
end

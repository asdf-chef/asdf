# frozen_string_literal: true

require 'spec_helper'

describe 'test::asdf_package' do
  SUPPORTED_PLATFORMS.each do |platform, versions|
    versions.each do |version|
      let(:chef_run) do
        ChefSpec::ServerRunner.new(platform: platform, version: version).converge(described_recipe)
      end

      context "using #{platform} #{version}" do
        it 'installs ruby package' do
          expect(chef_run).to install_asdf_package('ruby')
        end
      end
    end
  end
end

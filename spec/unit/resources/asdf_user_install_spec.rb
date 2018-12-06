require 'spec_helper'

describe 'test::asdf_user_install' do
  SUPPORTED_PLATFORMS.each do |platform, versions|
    versions.each do |version|
      let(:chef_run) do
        ChefSpec::ServerRunner.new(platform: platform, version: version).converge(described_recipe)
      end

      context "using #{platform} #{version}" do
        it 'installs asdf to user' do
          expect(chef_run).to install_asdf_user_install('vagrant')
        end
      end
    end
  end
end

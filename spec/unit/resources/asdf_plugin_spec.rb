# frozen_string_literal: true

require 'spec_helper'

describe 'test::asdf_plugin' do
  let(:ubuntu_1404) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe) }
  let(:ubuntu_1604) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  context 'using ubuntu 14.04' do
    it 'adds clojure plugin' do
      expect(ubuntu_1404).to add_asdf_plugin('clojure')
    end

    it 'removes clojure plugin' do
      expect(ubuntu_1404).to remove_asdf_plugin('clojure')
    end

    it 'adds nodejs plugin' do
      expect(ubuntu_1404).to add_asdf_plugin('nodejs')
    end

    it 'updates nodejs plugin' do
      expect(ubuntu_1404).to add_asdf_plugin('nodejs')
    end

    it 'adds ruby plugin' do
      expect(ubuntu_1404).to add_asdf_plugin('ruby')
    end
  end

  context 'using ubuntu 16.04' do
    it 'adds clojure plugin' do
      expect(ubuntu_1604).to add_asdf_plugin('clojure')
    end

    it 'removes clojure plugin' do
      expect(ubuntu_1604).to remove_asdf_plugin('clojure')
    end

    it 'adds nodejs plugin' do
      expect(ubuntu_1604).to add_asdf_plugin('nodejs')
    end

    it 'updates nodejs plugin' do
      expect(ubuntu_1604).to add_asdf_plugin('nodejs')
    end

    it 'adds ruby plugin' do
      expect(ubuntu_1604).to add_asdf_plugin('ruby')
    end
  end
end

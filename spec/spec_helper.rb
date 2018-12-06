# frozen_string_literal: true
require 'chefspec'
require 'chefspec/berkshelf'

# rubocop:disable Style/WordArray
SUPPORTED_PLATFORMS = {
  'amazon' => ['2'],
  'centos' => ['7'],
  'debian' => ['8', '9'],
  'fedora' => ['27', '28'],
  'ubuntu' => ['16.04', '18.04'],
}.freeze

RSpec.configure do |config|
  config.color     = true
  config.formatter = :documentation
  config.log_level = :error
end

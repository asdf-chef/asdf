# frozen_string_literal: true

require 'chefspec'
require 'chefspec/berkshelf'

SUPPORTED_PLATFORMS = {
  # rubocop:disable Style/WordArray
  'centos' => ['7'],
  'fedora' => ['27', '28'],
  'ubuntu' => ['14.04', '16.04', '18.04']
  # rubocop:enable Style/WordArray
}.freeze

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
  config.log_level = :error
end

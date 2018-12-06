# frozen_string_literal: true

require 'chefspec'
require 'chefspec/berkshelf'

SUPPORTED_PLATFORMS = {
  'centos' => %w(7),
  'debian' => %w(8 9),
  'fedora' => %w(27 28),
  'ubuntu' => %w(14.04 16.04 18.04),
}.freeze

RSpec.configure do |config|
  config.color     = true
  config.formatter = :documentation
  config.log_level = :error
end

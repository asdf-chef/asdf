property :code, String,
          name_property: true

property :environment, Hash

property :path, Array,
          default: []

property :returns, Array,
          default: [0]

property :timeout, [Integer, Float],
          default: 3600

use 'common_properties'

action_class do
  include Asdf::Cookbook::Helpers
end

action :run do
  bash new_resource.name do
    code script_code
    cwd asdf_user_home
    environment script_environment
    group asdf_user
    live_stream new_resource.live_stream
    returns new_resource.returns
    timeout new_resource.timeout if new_resource.timeout
    user asdf_user
  end
end

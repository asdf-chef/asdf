unified_mode true

property :command, String,
          name_property: true

use 'common_properties'

action_class do
  include Asdf::Cookbook::Helpers
end

action :run do
  asdf_script "asdf exec #{new_resource.command}" do
    live_stream new_resource.live_stream
    user new_resource.user if new_resource.user
  end
end

property :command, String, name_property: true
property :live_stream, [true, false], default: true
property :user, String

action :run do
  asdf_script "exec #{new_resource.command}" do
    live_stream new_resource.live_stream
  end
end

action_class do
  include Asdf::ScriptHelpers
end

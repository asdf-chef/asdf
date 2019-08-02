#
# Cookbook:: asdf
# Resource:: exec
#
# Copyright:: 2017-2018, Fernando Aleman, All Rights Reserved.

provides :asdf_exec

property :command, String,
         description: 'Command to run through asdf exec.',
         name_property: true

property :live_stream, [true, false],
         default: true,
         description: 'Whether or not to output verbose stream.'

property :user, String,
         description: 'Which user to run asdf code as.'

action :run do
  asdf_script "exec #{new_resource.command}" do
    live_stream new_resource.live_stream
  end
end

action_class do
  include Asdf::ScriptHelpers
end

property :command, String,
         description: 'Command to run through asdf exec.',
         name_property: true

property :live_stream, [true, false],
         description: 'Whether or not to output verbose stream.',
         default: true

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

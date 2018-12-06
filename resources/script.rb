#
# Cookbook:: asdf
# Resource:: script
#
# Copyright:: 2017-2018, Fernando Aleman, All Rights Reserved.

provides :asdf_script

property :code, String,
         description: 'asdf command to run.',
         name_property: true

property :environment, Hash,
         description: 'Environment variables to run script.'

property :live_stream, [true, false],
         default: false,
         description: 'Whether or not to output verbose stream.'

property :path, Array,
         description: 'Additional path to include in environment path.'

property :returns, Array,
         default: [0],
         description: 'Expected return code.'

property :timeout, [Integer, Float],
         default: 3600,
         description: 'Amount of time (in seconds) a command is to wait before timing out.'

property :user, String,
         description: 'Which user to run asdf code as.'

action :run do
  bash new_resource.name do
    code script_code
    cwd ::File.expand_path("~#{asdf_user}")
    environment(script_environment)
    group asdf_user
    live_stream new_resource.live_stream
    returns new_resource.returns
    timeout new_resource.timeout if new_resource.timeout
    user asdf_user
  end
end

action_class do
  include Asdf::ScriptHelpers

  def script_code
    code = if /^asdf\s/ =~ new_resource.code
             new_resource.code.split(' ').drop(1).join(' ')
           else
             new_resource.code
           end

    script = []
    script << %(export PATH="#{asdf_path}/shims:#{asdf_path}/bin:$PATH")
    script << %(source /etc/profile.d/asdf.sh)
    script << "asdf #{code}"
    script.join("\n").concat("\n")
  end

  def script_environment
    script_env = {}
    script.merge!(new_resource.environment) if new_resource.environment

    if new_resource.path
      script_env['PATH'] = "#{new_resource.path.join(':')}:#{ENV['PATH']}"
    end

    script_env['USER'] = asdf_user
    script_env['HOME'] = ::File.expand_path("~#{asdf_user}")

    script_env
  end
end

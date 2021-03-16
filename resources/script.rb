property :code, String, name_property: true
property :environment, Hash
property :live_stream, [true, false], default: true
property :path, Array, default: []
property :returns, Array, default: [0]
property :timeout, [Integer, Float], default: 3600
property :user, String

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
  include Asdf::Cookbook::Helpers

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

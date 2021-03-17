property :package, String,
          name_property: true

property :version, String

use 'common_properties'

action_class do
  include Asdf::Cookbook::Helpers

  def version
    if new_resource.version.nil?
      @version ||= shell_out_version
    else
      new_resource.version
    end
  end

  def shell_out_version
    cmd = Mixlib::ShellOut.new(
      %(export PATH="#{asdf_path}/shims:#{asdf_path}/bin:$PATH"; asdf list-all #{new_resource.package} | grep -v "[a-z]" | tail -1),
      user: asdf_user,
      env: { 'USER' => asdf_user, 'HOME' => asdf_user_home }
    )
    cmd.run_command
    cmd.stdout.chomp
  end

  def version_exists?
    ::Dir.exist?("#{asdf_path}/installs/#{new_resource.package}/#{version}")
  end
end

action :install do
  install_package_deps

  asdf_script "install #{new_resource.package} #{version}" do
    live_stream new_resource.live_stream
    user new_resource.user if new_resource.user
    not_if { version_exists? }
  end
end

action :global do
  asdf_script "global #{new_resource.package} #{version}" do
    live_stream new_resource.live_stream
    user new_resource.user if new_resource.user
    only_if { version_exists? }
  end
end

action :uninstall do
  asdf_script "uninstall #{new_resource.package} #{version}" do
    live_stream new_resource.live_stream
    user new_resource.user if new_resource.user
    only_if { version_exists? }
  end
end

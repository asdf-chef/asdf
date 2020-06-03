property :package, String, name_property: true
property :version, String, required: true
property :live_stream, [true, false], default: true
property :user, String

action :install do
  install_package_deps

  asdf_script "install #{new_resource.package} #{new_resource.version}" do
    live_stream new_resource.live_stream
    user new_resource.user if new_resource.user
    not_if { package_version_exists? }
  end
end

action :global do
  asdf_script "global #{new_resource.package} #{new_resource.version}" do
    live_stream new_resource.live_stream
    user new_resource.user if new_resource.user
    only_if { package_version_exists? }
  end
end

action :uninstall do
  asdf_script "uninstall #{new_resource.package} #{new_resource.version}" do
    live_stream new_resource.live_stream
    user new_resource.user if new_resource.user
    only_if { package_version_exists? }
  end
end

action_class do
  include Asdf::ScriptHelpers
  include Asdf::PackageHelpers

  def package_version_exists?
    ::Dir.exist?("#{asdf_path}/installs/#{new_resource.package}/#{new_resource.version}")
  end
end

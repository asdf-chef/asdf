#
# Cookbook:: asdf
# Resource:: package
#
# Copyright:: 2017-2018, Fernando Aleman, All Rights Reserved.

provides :asdf_package

property :live_stream, [true, false],
         default: false,
         description: 'Whether or not to output verbose stream.'

property :package, String,
         description: 'Which package to install.',
         name_property: true

property :user, String,
         description: 'Which user to run asdf code as.'

property :version, String,
         description: 'Which package version to install.',
         required: true

action :install do
  install_package_deps

  asdf_script "install #{new_resource.package} #{new_resource.version}" do
    live_stream new_resource.live_stream
    not_if { package_version_exists? }
  end

  install_post_package_deps
end

action :global do
  asdf_script "global #{new_resource.package} #{new_resource.version}" do
    live_stream new_resource.live_stream
    only_if { package_version_exists? }
  end
end

action :uninstall do
  asdf_script "uninstall #{new_resource.package} #{new_resource.version}" do
    live_stream new_resource.live_stream
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

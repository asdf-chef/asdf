# frozen_string_literal: true
#
# Cookbook:: asdf
# Resource:: package
#
# Copyright:: 2017, Fernando Aleman
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

provides :asdf_package

property :package, String, name_property: true
property :user, String, required: true
property :version, String, required: true
property :live_stream, [true, false], default: false

default_action :install

action :install do
  unless ::Dir.exist?("#{asdf_path}/installs/#{new_resource.package}")
    install_package_deps(new_resource.package)
  end

  asdf_script "install #{new_resource.package} #{new_resource.version}" do
    user new_resource.user
    code "asdf install #{new_resource.package} #{new_resource.version}"
    live_stream new_resource.live_stream
    not_if { ::Dir.exist?("#{asdf_path}/installs/#{new_resource.package}/#{new_resource.version}") }
  end
end

action :global do
  asdf_script "global #{new_resource.package} #{new_resource.version}" do
    user new_resource.user
    code "asdf global #{new_resource.package} #{new_resource.version}"
    live_stream new_resource.live_stream
    only_if { ::Dir.exist?("#{asdf_path}/installs/#{new_resource.package}/#{new_resource.version}") }
  end
end

action :uninstall do
  asdf_script "uninstall #{new_resource.package} #{new_resource.version}" do
    user new_resource.user
    code "asdf uninstall #{new_resource.package} #{new_resource.version}"
    live_stream new_resource.live_stream
    only_if { ::Dir.exist?("#{asdf_path}/installs/#{new_resource.package}/#{new_resource.version}") }
  end
end

action_class do
  include Chef::Asdf::ScriptHelpers
  include Chef::Asdf::PackageHelpers
end

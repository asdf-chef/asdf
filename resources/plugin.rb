# frozen_string_literal: true
#
# Cookbook:: asdf
# Resource:: plugin
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

provides :plugin

property :user, String, required: true
property :git_url, String
property :live_stream, [true, false], default: false

action :add do
  asdf_script "plugin-add #{new_resource.name}" do
    user new_resource.user
    code "asdf plugin-add #{new_resource.name} #{new_resource.git_url}".strip
    live_stream new_resource.live_stream
    not_if { plugin_installed? }
  end
end

action :update do
  asdf_script "plugin-update #{new_resource.name}" do
    user new_resource.user
    code "asdf plugin-update #{new_resource.name}"
    live_stream new_resource.live_stream
    only_if { plugin_can_be_updated? }
  end
end

action :remove do
  asdf_script "plugin-remove #{new_resource.name}" do
    user new_resource.user
    code "asdf plugin-remove #{new_resource.name}"
    live_stream new_resource.live_stream
    only_if { plugin_installed? }
  end
end

action_class do
  include Chef::Asdf::ScriptHelpers

  def plugin_installed?
    ::Dir.exist?("#{asdf_path}/plugins/#{new_resource.name}")
  end

  def plugin_can_be_updated?
    new_resource.name == '--all' || new_resource.name != '--all' && plugin_installed?
  end
end

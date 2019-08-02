#
# Cookbook:: asdf
# Resource:: plugin
#
# Copyright:: 2017-2018, Fernando Aleman, All Rights Reserved.

provides :asdf_plugin

property :git_url, String,
         description: 'Git url to checkout plugin from.'

property :live_stream, [true, false],
         default: true,
         description: 'Whether or not to output verbose stream.'

property :user, String,
         description: 'Which user to run asdf code as.'

action :add do
  asdf_script "plugin-add #{new_resource.name}" do
    live_stream new_resource.live_stream
    not_if { plugin_installed? }
  end
end

action :update do
  asdf_script "plugin-update #{new_resource.name}" do
    live_stream new_resource.live_stream
    only_if { plugin_can_be_updated? }
  end
end

action :remove do
  asdf_script "plugin-remove #{new_resource.name}" do
    live_stream new_resource.live_stream
    only_if { plugin_installed? }
  end
end

action_class do
  include Asdf::ScriptHelpers

  def plugin_installed?
    ::Dir.exist?("#{asdf_path}/plugins/#{new_resource.name}")
  end

  def plugin_can_be_updated?
    new_resource.name == '--all' || new_resource.name != '--all' && plugin_installed?
  end
end

# frozen_string_literal: true
#
# Cookbook:: asdf
# Resource:: script
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

provides :asdf_script

property :user, String, required: true
property :code, String, required: true
property :group, String, default: lazy { user }
property :cwd, String, default: lazy { ::File.expand_path("~#{user}") }
property :creates, String
property :path, Array
property :environment, Hash
property :returns, Array, default: [0]
property :timeout, Integer
property :umask, [String, Integer]
property :live_stream, [true, false], default: false

action :run do
  bash new_resource.name do
    user new_resource.user
    code script_code
    group new_resource.group
    cwd new_resource.cwd
    creates new_resource.creates if new_resource.creates
    environment(script_environment)
    returns new_resource.returns
    timeout new_resource.timeout if new_resource.timeout
    umask new_resource.umask if new_resource.umask
    live_stream new_resource.live_stream
  end
end

action_class do
  include Chef::Asdf::ScriptHelpers

  def script_code
    script = []
    script << %(export PATH="#{asdf_path}/bin:$PATH")
    script << %(source /etc/profile.d/asdf.sh)
    script << new_resource.code
    script.join("\n").concat("\n")
  end

  def script_environment
    script_env = {}
    script.merge!(new_resource.environment) if new_resource.environment

    if new_resource.path
      script_env['PATH'] = "#{new_resource.path.join(':')}:#{ENV['PATH']}"
    end

    script_env['USER'] = new_resource.user
    script_env['HOME'] = ::File.expand_path("~#{new_resource.user}")

    script_env
  end
end

# frozen_string_literal: true
#
# Cookbook:: asdf
# Resource:: user_install
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

provides :asdf_user_install

property :user, String, name_property: true
property :git_url, String, default: 'https://github.com/asdf-vm/asdf.git'
property :git_ref, String, default: 'v0.4.0'
property :group, String, default: lazy { user }
property :home_dir, String, default: lazy { ::File.expand_path("~#{user}") }
property :user_prefix, String, default: lazy { ::File.join(home_dir, '.asdf') }
property :update_asdf, [true, false], default: true
property :legacy_version_file, [true, false], default: false

action :install do
  include_recipe 'apt'

  install_asdf_deps

  node.run_state['asdf_path'] ||= {}
  node.run_state['asdf_path'][new_resource.user] ||= new_resource.user_prefix

  cookbook_file '/etc/profile.d/asdf.sh' do
    cookbook 'asdf'
    source 'asdf.sh'
    owner 'root'
    mode 0755
    action :create_if_missing
  end

  git new_resource.user_prefix do
    repository new_resource.git_url
    reference new_resource.git_ref
    action :checkout if new_resource.update_asdf == false
    user new_resource.user
    group new_resource.group
    notifies :run, 'ruby_block[Add asdf to PATH]', :immediately
  end

  directory "#{new_resource.user_prefix}/installs" do
    owner new_resource.user
    group new_resource.group
    mode 0755
  end

  directory "#{new_resource.user_prefix}/plugins" do
    owner new_resource.user
    group new_resource.group
    mode 0755
  end

  directory "#{new_resource.user_prefix}/shims" do
    owner new_resource.user
    group new_resource.group
    mode 0755
  end

  file "#{new_resource.home_dir}/.asdfrc" do
    content "legacy_version_file = #{new_resource.legacy_version_file ? 'yes' : 'no'}"
    mode '0755'
    owner new_resource.user
    group new_resource.group
    action :create_if_missing
  end

  ruby_block 'Add asdf to PATH' do
    block do
      ENV['PATH'] = "#{new_resource.user_prefix}/bin:#{new_resource.user_prefix}/shims:#{ENV['PATH']}"
    end
    action :nothing
  end

  bash "Initialize user #{new_resource.user} asdf" do
    code %(source #{new_resource.user_prefix}/asdf.sh)
    action :nothing
    subscribes :run, "git[#{new_resource.user_prefix}]", :immediately
  end

  bash "Initialize user #{new_resource.user} asdf bash completion" do
    code %(source #{new_resource.user_prefix}/completions/asdf.bash)
    action :nothing
    subscribes :run, "bash[Initialize user #{new_resource.user} asdf]", :immediately
  end
end

action_class do
  include Chef::Asdf::PackageHelpers
end

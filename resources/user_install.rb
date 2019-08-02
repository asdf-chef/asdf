#
# Cookbook:: asdf
# Resource:: user_install
#
# Copyright:: 2017-2018, Fernando Aleman, All Rights Reserved.

provides :asdf_user_install

property :git_ref, String,
         description: 'Git reference to checkout.'

property :git_url, String,
         default: 'https://github.com/asdf-vm/asdf.git',
         description: 'Git url to checkout asdf from.'

property :legacy_version_file, [true, false],
         default: false,
         description: 'Whether or not to use legacy version files.'

property :update_asdf, [true, false],
         default: true,
         description: 'Whether or not to update asdf.'

property :user, String,
         description: 'Which user to install asdf to.',
         name_property: true

action :install do
  install_asdf_deps

  execute 'updatedb'

  node.run_state['asdf_user'] = new_resource.user
  home_dir = ::File.expand_path("~#{new_resource.user}")
  user_asdf_path = ::File.join(home_dir, '.asdf')

  node.run_state['asdf_path'] ||= {}
  node.run_state['asdf_path'][new_resource.user] ||= user_asdf_path

  cookbook_file '/etc/profile.d/asdf.sh' do
    cookbook 'asdf'
    source 'asdf.sh'
    owner 'root'
    mode '0755'
    action :create_if_missing
  end

  git user_asdf_path do
    repository new_resource.git_url
    revision new_resource.git_ref if new_resource.git_ref
    action :checkout if new_resource.update_asdf == false
    user new_resource.user
    group new_resource.user
    notifies :run, 'ruby_block[Add asdf to PATH]', :immediately
  end

  directory "#{user_asdf_path}/installs" do
    owner new_resource.user
    group new_resource.user
    mode '0755'
  end

  directory "#{user_asdf_path}/plugins" do
    owner new_resource.user
    group new_resource.user
    mode '0755'
  end

  directory "#{user_asdf_path}/shims" do
    owner new_resource.user
    group new_resource.user
    mode '0755'
  end

  file "#{home_dir}/.asdfrc" do
    content "legacy_version_file = #{new_resource.legacy_version_file ? 'yes' : 'no'}"
    mode '0755'
    owner new_resource.user
    group new_resource.user
    action :create_if_missing
  end

  ruby_block 'Add asdf to PATH' do
    block do
      ENV['PATH'] = "#{user_asdf_path}/bin:#{user_asdf_path}/shims:#{ENV['PATH']}"
    end
    action :nothing
  end

  bash "Initialize user #{new_resource.user} asdf" do
    code %(source #{user_asdf_path}/asdf.sh)
    action :nothing
    subscribes :run, "git[#{user_asdf_path}]", :immediately
  end

  bash "Initialize user #{new_resource.user} asdf bash completion" do
    code %(source #{user_asdf_path}/completions/asdf.bash)
    action :nothing
    subscribes :run, "bash[Initialize user #{new_resource.user} asdf]", :immediately
  end

  link '/usr/bin/shasum' do
    to '/usr/bin/sha1sum'
    not_if 'test -L /usr/bin/shasum'
    only_if { %w(amazon fedora rhel).include?(node['platform_family']) }
  end
end

action_class do
  include Asdf::PackageHelpers
end

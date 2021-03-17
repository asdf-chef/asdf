property :user, String, name_property: true
property :git_url, String, default: 'https://github.com/asdf-vm/asdf.git'
property :git_ref, String
property :update_asdf, [true, false], default: false
property :legacy_version_file, [true, false], default: false

action_class do
  include Asdf::Cookbook::Helpers
end

action :install do
  install_asdf_deps

  execute 'updatedb'

  node.run_state['asdf_user'] = new_resource.user

  cookbook_file '/etc/profile.d/asdf.sh' do
    cookbook 'asdf'
    source 'asdf.sh'
    owner 'root'
    mode '0755'
    action :create_if_missing
  end

  if new_resource.update_asdf && ::Dir.exist?(asdf_path)
    directory asdf_path do
      recursive true
      action :delete
    end
  end

  git asdf_path do
    repository new_resource.git_url
    revision new_resource.git_ref if new_resource.git_ref
    action :checkout unless new_resource.update_asdf
    user new_resource.user
    group new_resource.user
    notifies :run, 'ruby_block[Add asdf to PATH]', :immediately
  end

  %w(installs plugins shims).each do |dir|
    directory "#{asdf_path}/#{dir}" do
      owner new_resource.user
      group new_resource.user
      mode '0755'
    end
  end

  file ::File.join(asdf_user_home, '.asdfrc') do
    content "legacy_version_file = #{new_resource.legacy_version_file ? 'yes' : 'no'}"
    mode '0755'
    owner new_resource.user
    group new_resource.user
    action :create_if_missing
  end

  ruby_block 'Add asdf to PATH' do
    block do
      ENV['PATH'] = "#{asdf_path}/bin:#{asdf_path}/shims:#{ENV['PATH']}"
    end
    action :nothing
  end

  bash "Initialize user #{new_resource.user} asdf" do
    code %(source #{asdf_path}/asdf.sh)
    action :nothing
    subscribes :run, "git[#{asdf_path}]", :immediately
  end

  bash "Initialize user #{new_resource.user} asdf bash completion" do
    code %(source #{asdf_path}/completions/asdf.bash)
    action :nothing
    subscribes :run, "bash[Initialize user #{new_resource.user} asdf]", :immediately
  end

  link '/usr/bin/shasum' do
    to '/usr/bin/sha1sum'
    not_if 'test -L /usr/bin/shasum'
    only_if { platform_family?('amazon', 'fedora', 'rhel') }
  end
end

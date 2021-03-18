apt_update 'update'

include_recipe 'test::vagrant'

asdf_user_install 'vagrant'

asdf_plugin 'clojure'

asdf_plugin 'clojure' do
  action :remove
end

asdf_plugin 'nodejs'

asdf_plugin 'nodejs' do
  action :update
end

asdf_plugin 'ruby'

asdf_package 'ruby' do
  version '3.0.0'
  action [:install, :global]
end

asdf_exec 'gem install pry'

include_recipe 'test::testuser'

asdf_user_install 'testuser' do
  git_ref '4a3e3d6ebd1b544d0618a077a14165566d5b7a4a'
end

asdf_plugin 'python' do
  user 'testuser'
end

asdf_package 'python' do
  version 'pypy3.6-7.3.1'
  user 'testuser'
  action [:install, :global]
end

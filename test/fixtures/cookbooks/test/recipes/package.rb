include_recipe 'test::user_install'

asdf_plugin 'ruby'

asdf_package 'ruby' do
  version '2.6.3'
  action [:install, :global]
end

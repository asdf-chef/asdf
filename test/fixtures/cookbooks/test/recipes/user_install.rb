apt_update if node['platform_family'] == 'debian'

include_recipe 'test::vagrant'

asdf_user_install 'vagrant'

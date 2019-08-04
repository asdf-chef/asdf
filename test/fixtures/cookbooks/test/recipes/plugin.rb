include_recipe 'test::user_install'

asdf_plugin 'clojure'

asdf_plugin 'clojure' do
  action :remove
end

asdf_plugin 'nodejs'

asdf_plugin 'nodejs' do
  action :update
end

asdf_plugin 'ruby'

asdf_plugin 'php'

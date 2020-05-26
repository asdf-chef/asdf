apt_update "update"

include_recipe "test::vagrant"

asdf_user_install "vagrant"

asdf_script "update"

asdf_plugin "clojure"

asdf_plugin "clojure" do
  action :remove
end

asdf_plugin "nodejs"

asdf_plugin "nodejs" do
  action :update
end

asdf_plugin "ruby"

asdf_package "ruby" do
  version "2.6.3"
  action [:install, :global]
end

asdf_exec "gem install pry"

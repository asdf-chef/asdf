require "chefspec"
require "chefspec/berkshelf"

RSpec.configure do |config|
  config.color     = true
  config.formatter = :documentation
end

def asdf_user
  "vagrant"
end

def asdf_path
  "/home/vagrant/.asdf"
end

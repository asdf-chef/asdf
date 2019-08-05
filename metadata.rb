name 'asdf'
maintainer 'Fernando Aleman'
maintainer_email 'fernandoaleman@mac.com'
license 'Apache-2.0'
description 'Installs and configures asdf'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.5.1'
chef_version '>= 14.3'

issues_url 'https://github.com/asdf-chef/asdf/issues'
source_url 'https://github.com/asdf-chef/asdf'

%w(amazon centos debian fedora oracle redhat scientific ubuntu).each do |os|
  supports os
end

depends 'ark'

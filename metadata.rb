name 'asdf'
maintainer 'Fernando Aleman'
maintainer_email 'fernandoaleman@mac.com'
license 'Apache-2.0'
description 'Installs and configures asdf'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.3.0'
chef_version '>= 12.9' if respond_to?(:chef_version)

issues_url 'https://github.com/asdf-chef/asdf/issues'
source_url 'https://github.com/asdf-chef/asdf'

supports 'centos'
supports 'debian'
supports 'fedora'
supports 'oracle'
supports 'redhat'
supports 'scientific'
supports 'ubuntu'

depends 'build-essential'
depends 'chef-sugar'
depends 'ark'

# frozen_string_literal: true

name 'asdf'
maintainer 'Fernando Aleman'
maintainer_email 'fernandoaleman@mac.com'
license 'Apache-2.0'
description 'Installs and configures asdf'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.1'
chef_version '>= 12.9' if respond_to?(:chef_version)

issues_url 'https://github.com/asdf-chef/asdf/issues'
source_url 'https://github.com/asdf-chef/asdf'

supports 'centos', '>= 7'
supports 'fedora', '>= 27'
supports 'oracle', '>= 7'
supports 'redhat', '>= 7'
supports 'scientific', '>= 7'
supports 'ubuntu', '>= 14.04'

depends 'build-essential'
depends 'chef-sugar'
depends 'ark'

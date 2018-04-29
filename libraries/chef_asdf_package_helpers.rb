# frozen_string_literal: true
#
# Cookbook:: asdf
# Library:: Chef::Asdf::PackageDeps
#
# Copyright:: 2017, Fernando Aleman
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class Chef
  module Asdf
    module PackageHelpers
      def install_asdf_deps
        packages = %w(automake autoconf build-essential grep libreadline-dev libncurses-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev unzip)

        case node['platform_version']
        when '18.04'
          packages << 'git'
        else
          packages << 'git-core'
        end

        apt_package packages
      end

      def install_package_deps(package)
        case package
        when 'R'
          apt_package %w(libcurl3-dev libreadline-dev gfortran libxt-dev libbz2-dev liblzma-dev libpcre3 libpcre3-dev)
        when 'clojure', 'gradle', 'sbt', 'scala'
          apt_package 'default-jre'
        when 'erlang'
          packages = %w(libncurses5-dev libgl1-mesa-dev libglu1-mesa-dev libpng3 libssh-dev xsltproc fop libxml2-utils default-jdk)

          case node['platform_version']
          when '14.04'
            packages << 'libwxgtk2.8-dev'
          when '16.04'
            packages << 'libwxgtk3.0-dev'
          end

          apt_package packages
        when 'haskell'
          apt_package 'libgmp-dev'
        when 'nodejs'
          script_code = []

          gpg_keys = %w(94AE36675C464D64BAFA68DD7434390BDBE9B9C5 FD3A5288F042B6850C66B31F09FE44734EB7990E 71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 DD8F2338BAE7501E3DD5AC78C273792F7D83545D C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 B9AE9905FFD7803F25714661B63B535A4C206CA9 56730D5401028683275BD23C23EFEFE93C4CFFFE)
          gpg_keys.each do |gpg_key|
            script_code << %(gpg --keyserver pool.sks-keyservers.net --recv-keys #{gpg_key})
          end

          asdf_script 'install nodejs package dependencies' do
            user new_resource.user
            code script_code.join("\n").concat("\n")
            live_stream new_resource.live_stream
            only_if { ::Dir.exist?("#{asdf_path}/plugins/nodejs") }
          end
        when 'ocaml'
          apt_package 'aspcud'
        when 'openresty'
          apt_package %w(openssl libssl-dev libpcre3 libpcre3-dev)
        when 'php'
          apt_package %w(curl libjpeg-dev libpng12-dev openssl libssl-dev libcurl4-openssl-dev pkg-config libsslcommon2-dev libreadline-dev libedit-dev zlib1g-dev libicu-dev libxml2-dev gettext libmysqlclient-dev libpq-dev)

          include_recipe 'ark'

          # PHP 5 fails to build on Bison 3
          ark 'bison' do
            url 'http://ftp.gnu.org/gnu/bison/bison-2.7.tar.gz'
            version '2.7'
            autoconf_opts %w(--with-libiconv-prefix=/usr/local/libiconv/)
            action :install_with_make
          end
        when 'postgres'
          apt_package 'libreadline-dev'
        when 'python'
          apt_package %w(libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev)
        end
      end
    end
  end
end

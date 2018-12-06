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
        include_recipe 'build-essential'
        package %w(automake git grep libtool mlocate unzip)

        if redhat? || fedora?
          execute 'updatedb'
          package %w(bzip2 libffi-devel libxslt-devel libyaml-devel readline-devel openssl-devel unixODBC-devel)
        elsif debian?
          package %w(libffi-dev libreadline-dev libssl-dev libxslt-dev libyaml-dev unixodbc-dev)
        end
      end

      def install_package_deps(p)
        case p
        when 'R'
          if redhat? || fedora?
            package %w(libcurl-devel libgfortran libXt-devel pcre2 pcre2-devel xz-devel)
          elsif debian?
            package %w(gfortran libbz2-dev libcurl3-dev liblzma-dev libpcre3 libpcre3-dev libxt-dev)
          end
        when 'clojure', 'gradle', 'sbt', 'scala'
          if redhat? || fedora?
            package 'java-1.8.0-openjdk'
          elsif debian?
            package 'default-jre'
          end
        when 'erlang'
          if redhat? || fedora?
            package %w(gcc gcc-c++ glibc-devel java-1.8.0-openjdk-devel ncurses-devel openssl-devel wget wxBase.x86_64)
          elsif debian?
            packages = %w(libgl1-mesa-dev libglu1-mesa-dev libpng3 libssh-dev xsltproc fop libxml2-utils default-jdk)

            if ubuntu_trusty?
              packages << 'libwxgtk2.8-dev'
            elsif ubuntu_xenial? || ubuntu_bionic?
              packages << 'libwxgtk3.0-dev'
            end
          end

          package packages
        when 'haskell'
          if redhat? || fedora?
            package 'gmp-devel'
          elsif debian?
            package 'libgmp-dev'
          end
        when 'nodejs'
          asdf_script 'install nodejs package dependencies' do
            user new_resource.user
            code 'bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring'
            live_stream new_resource.live_stream
            only_if { ::Dir.exist?("#{asdf_path}/plugins/nodejs") }
          end
        when 'ocaml'
          package 'aspcud' if debian?
        when 'openresty'
          if redhat? || fedora?
            package %w(openssl openssl-devel pcre2 pcre2-devel)
          elsif debian?
            package %w(openssl libssl-dev libpcre3 libpcre3-dev)
          end
        when 'php'
          if redhat? || fedora?
            package %w(libcurl libcurl-devel libcxx libcxx-devel libjpeg-turbo-devel libpng-devel openssl openssl-devel re2c readline-devel libedit-devel zlib-devel libicu-devel libxml2-devel postgresql-libs)
          elsif debian?
            packages = %w(curl libjpeg-dev openssl libssl-dev libcurl4-openssl-dev pkg-config libreadline-dev libedit-dev zlib1g-dev libicu-dev libxml2-dev libmysqlclient-dev libpq-dev)

            if ubuntu_trusty?
              packages << 'libpng12-dev'
            elsif ubuntu_xenial?
              packages << 'libpng16-dev'
            elsif ubuntu_bionic?
              # Fix for PHP bug
              link '/usr/local/include/curl' do
                to '/usr/include/x86_64-linux-gnu/curl'
              end

              packages << 'libcurl4' << 'libpng-dev' << 're2c'
            end

            package packages

            package 'bison' do
              action :purge
            end

            include_recipe 'ark'

            # PHP 5 fails to build on Bison 3
            ark 'bison' do
              url 'http://ftp.gnu.org/gnu/bison/bison-2.7.tar.gz'
              version '2.7'
              autoconf_opts %w(--with-libiconv-prefix=/usr/local/libiconv/)
              action :install_with_make
            end
          end

        when 'postgres'
          if redhat? || fedora?
            package 'readline-devel'
          elsif debian?
            package 'libreadline-dev'
          end
        when 'python'
          if redhat? || fedora?
            package %w(openssl-dev zlib-devel readline-devel sqlite-devel wget curl llvm)
          elsif debian?
            package %w(libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm xz-utils tk-dev)
          end
        when 'ruby'
          package 'zlib1g-dev' if debian?
          package 'libssl1.0-dev' if ubuntu_bionic?
        end
      end
    end
  end
end

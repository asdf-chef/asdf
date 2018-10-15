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
        include_recipe 'build-essential'
        package %w(automake git grep libreadline-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev unzip)
      end

      def install_package_deps(p)
        case p
        when 'R'
          package %w(libcurl3-dev libreadline-dev gfortran libxt-dev libbz2-dev liblzma-dev libpcre3 libpcre3-dev)
        when 'clojure', 'gradle', 'sbt', 'scala'
          package 'default-jre'
        when 'erlang'
          packages = %w(libgl1-mesa-dev libglu1-mesa-dev libpng3 libssh-dev xsltproc fop libxml2-utils default-jdk)

          if ubuntu_trusty?
            packages << 'libwxgtk2.8-dev'
          elsif ubuntu_xenial? || ubuntu_bionic?
            packages << 'libwxgtk3.0-dev'
          end

          package packages
        when 'haskell'
          package 'libgmp-dev'
        when 'nodejs'
          asdf_script 'install nodejs package dependencies' do
            user new_resource.user
            code 'bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring'
            live_stream new_resource.live_stream
            only_if { ::Dir.exist?("#{asdf_path}/plugins/nodejs") }
          end
        when 'ocaml'
          package 'aspcud'
        when 'openresty'
          package %w(openssl libssl-dev libpcre3 libpcre3-dev)
        when 'php'
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
        when 'postgres'
          package 'libreadline-dev'
        when 'python'
          package %w(libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm xz-utils tk-dev)
        when 'ruby'
          if ubuntu_bionic?
            package 'libssl1.0-dev'
          end
        end
      end
    end
  end
end

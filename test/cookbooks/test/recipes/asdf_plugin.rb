# frozen_string_literal: true

asdf_plugin 'clojure' do
  user 'vagrant'
end

asdf_plugin 'clojure' do
  user 'vagrant'
  action :remove
end

asdf_plugin 'nodejs' do
  user 'vagrant'
end

asdf_plugin 'nodejs' do
  user 'vagrant'
  action :update
end

asdf_plugin 'ruby' do
  user 'vagrant'
end

asdf_plugin 'php' do
  user 'vagrant'
end

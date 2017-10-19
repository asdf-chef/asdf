# frozen_string_literal: true

if defined?(ChefSpec)
  {
    asdf_user_install: [:install],
    asdf_package: [:install, :global, :uninstall],
    asdf_plugin: [:add, :update, :remove],
    asdf_script: [:run]
  }.each do |resource, actions|
    actions.each do |action|
      define_method("#{action}_#{resource}") do |name|
        ChefSpec::Matchers::ResourceMatcher.new(resource, action, name)
      end
    end
  end
end

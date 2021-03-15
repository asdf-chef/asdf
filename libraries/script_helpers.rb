module Asdf
  module ScriptHelpers
    def asdf_path
      node.run_state['asdf_path'] ||= {}
      node.run_state['asdf_path'][asdf_user]
    end

    def asdf_user
      new_resource.user || node.run_state['asdf_user']
    end
  end
end

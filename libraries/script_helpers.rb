#
# Cookbook:: asdf
# Library:: script_helpers
#
# Copyright:: 2017-2018, 1000Bulbs, All Rights Reserved.

module Asdf
  module ScriptHelpers
    def asdf_path
      node.run_state["asdf_path"] ||= {}
      node.run_state["asdf_path"][asdf_user]
    end

    def asdf_user
      new_resource.user || node.run_state["asdf_user"]
    end
  end
end

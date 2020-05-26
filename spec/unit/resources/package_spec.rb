require "spec_helper"

describe "asdf_package" do
  step_into :asdf_package
  platform "ubuntu"

  context "with default properties" do
    recipe do
      asdf_package "ruby" do
        version "2.6.3"
      end
    end

    it do
      is_expected.to run_asdf_script("install ruby 2.6.3")
        .with_live_stream(true)
    end
  end
end

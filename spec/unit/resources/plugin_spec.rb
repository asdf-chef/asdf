require "spec_helper"

describe "asdf_plugin" do
  step_into :asdf_plugin
  platform "ubuntu"

  context "with default properties" do
    recipe do
      asdf_plugin "ruby"
    end

    before do
      allow(Dir).to receive(:exist?).and_call_original
      allow(Dir).to receive(:exist?).with("/home/vagrant/.asdf/plugins/ruby").and_return(false)
    end

    it do
      is_expected.to run_asdf_script("plugin-add ruby")
        .with_live_stream(true)
    end
  end
end

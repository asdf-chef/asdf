require "spec_helper"

describe "asdf_script" do
  step_into :asdf_script
  platform "ubuntu"

  context "with default properties" do
    recipe do
      asdf_script "update"
    end

    before do
      allow(File).to receive(:expand_path).and_call_original
      allow(File).to receive(:expand_path).with("~vagrant").and_return("/home/vagrant")
    end

    it do
      is_expected.to run_bash("update")
        .with_code('export PATH="/shims:/bin:$PATH"
source /etc/profile.d/asdf.sh
asdf update
')
        .with_cwd("/home/vagrant")
        .with_group("vagrant")
        .with_live_stream(true)
        .with_returns([0])
        .with_timeout(3600)
        .with_user("vagrant")
    end
  end
end

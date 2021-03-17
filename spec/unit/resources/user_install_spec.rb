require 'spec_helper'

describe 'asdf_user_install' do
  platform 'ubuntu'

  step_into :asdf_user_install

  recipe do
    user 'vagrant'
    asdf_user_install 'vagrant'
  end

  it { is_expected.to run_execute('updatedb') }
  it { is_expected.to create_if_missing_cookbook_file('/etc/profile.d/asdf.sh') }

  it do
    is_expected.to checkout_git('/home/vagrant/.asdf')
      .with_repository('https://github.com/asdf-vm/asdf.git')
      .with_user('vagrant')
      .with_group('vagrant')
  end

  it { expect(chef_run.git('/home/vagrant/.asdf')).to notify('ruby_block[Add asdf to PATH]').to(:run).immediately }

  %w(installs plugins shims).each do |dir|
    it do
      is_expected.to create_directory("/home/vagrant/.asdf/#{dir}")
        .with_owner('vagrant')
        .with_group('vagrant')
        .with_mode('0755')
    end
  end

  it do
    is_expected.to create_if_missing_file('/home/vagrant/.asdfrc')
      .with_content('legacy_version_file = no')
      .with_mode('0755')
      .with_owner('vagrant')
      .with_group('vagrant')
  end

  it { expect(chef_run.bash('Initialize user vagrant asdf')).to subscribe_to('git[/home/vagrant/.asdf]').on(:run).immediately }
  it { expect(chef_run.bash('Initialize user vagrant asdf bash completion')).to subscribe_to('bash[Initialize user vagrant asdf]').on(:run).immediately }
end

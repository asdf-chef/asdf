# frozen_string_literal: true

control 'asdf_user_install' do
  title 'Installs asdf'

  desc 'Installs asdf'
  describe bash('sudo -H -u vagrant bash -c "source /etc/profile.d/asdf.sh && which asdf"') do
    its('exit_status') { should eq 0 }
  end

  desc 'Creates asdf.sh file'
  describe file('/etc/profile.d/asdf.sh') do
    it { should exist }
    it { should be_file }
    its('owner') { should eq 'root' }
  end

  desc 'Creates installs directory'
  describe directory('/home/vagrant/.asdf/installs') do
    it { should exist }
    it { should be_directory }
    its('owner') { should eq 'vagrant' }
  end

  desc 'Creates plugins directory'
  describe directory('/home/vagrant/.asdf/plugins') do
    it { should exist }
    it { should be_directory }
    its('owner') { should eq 'vagrant' }
  end

  desc 'Creates shims directory'
  describe directory('/home/vagrant/.asdf/shims') do
    it { should exist }
    it { should be_directory }
    its('owner') { should eq 'vagrant' }
  end

  desc 'Creates .asdfrc file'
  describe file('/home/vagrant/.asdfrc') do
    it { should exist }
    it { should be_file }
    its('owner') { should eq 'vagrant' }
    its('content') { should eq 'legacy_version_file = no' }
  end
end

control 'asdf_plugin' do
  title 'Adds, updates and removed asdf plugins'

  desc 'Adds and removes clojure plugin'
  describe bash('sudo -H -u vagrant bash -c "source /etc/profile.d/asdf.sh && asdf plugin-list"') do
    its('stdout') { should_not include('clojure') }
  end

  desc 'Adds nodejs plugin'
  describe bash('sudo -H -u vagrant bash -c "source /etc/profile.d/asdf.sh && asdf plugin-list"') do
    its('stdout') { should include('nodejs') }
  end

  desc 'Adds ruby plugin'
  describe bash('sudo -H -u vagrant bash -c "source /etc/profile.d/asdf.sh && asdf plugin-list"') do
    its('stdout') { should include('ruby') }
  end

  desc 'Adds php plugin'
  describe bash('sudo -H -u vagrant bash -c "source /etc/profile.d/asdf.sh && asdf plugin-list"') do
    its('stdout') { should include('php') }
  end
end

control 'asdf_package' do
  title 'Installs, uninstalls and sets global asdf packages'

  desc 'Installs nodejs 8.7.0'
  describe bash('sudo -H -u vagrant bash -c "source /etc/profile.d/asdf.sh && asdf list nodejs"') do
    its('stdout') { should include('8.7.0') }
    its('exit_status') { should eq 0 }
  end

  desc 'Sets nodejs 8.7.0 to global'
  describe file('/home/vagrant/.tool-versions') do
    its('content') { should include('nodejs 8.7.0') }
  end

  desc 'Installs ruby 2.4.2'
  describe bash('sudo -H -u vagrant bash -c "source /etc/profile.d/asdf.sh && asdf list ruby"') do
    its('stdout') { should include('2.4.2') }
    its('exit_status') { should eq 0 }
  end

  desc 'Sets ruby 2.4.2 to global'
  describe file('/home/vagrant/.tool-versions') do
    its('content') { should include('ruby 2.4.2') }
  end

  desc 'Installs php 5.6.32'
  describe bash('sudo -H -u vagrant bash -c "source /etc/profile.d/asdf.sh && asdf list php"') do
    its('stdout') { should include('5.6.32') }
    its('exit_status') { should eq 0 }
  end

  desc 'Sets php 5.6.32 to global'
  describe file('/home/vagrant/.tool-versions') do
    its('content') { should include('php 5.6.32') }
  end
end

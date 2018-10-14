# frozen_string_literal: true

control 'asdf_package ruby 2.5.1' do
  title 'Installs ruby 2.5.1 and sets as global'

  desc 'Installs ruby 2.5.1'
  describe bash('sudo -H -u vagrant bash -c "source /etc/profile.d/asdf.sh && asdf list ruby"') do
    its('stdout') { should include('2.5.1') }
  end

  desc 'Sets ruby 2.5.1 to global'
  describe file('/home/vagrant/.tool-versions') do
    its('content') { should include('ruby 2.5.1') }
  end
end

control 'asdf_package ruby 2.4.4' do
  title 'Installs ruby 2.4.4'

  desc 'Installs ruby 2.4.4'
  describe bash('sudo -H -u vagrant bash -c "source /etc/profile.d/asdf.sh && asdf list ruby"') do
    its('stdout') { should include('2.4.4') }
  end
end

control 'asdf_package ruby 2.3.7' do
  title 'Installs ruby 2.3.7'

  desc 'Installs ruby 2.3.7'
  describe bash('sudo -H -u vagrant bash -c "source /etc/profile.d/asdf.sh && asdf list ruby"') do
    its('stdout') { should include('2.3.7') }
  end
end

control 'asdf_package ruby 2.2.10' do
  title 'Installs ruby 2.2.10'

  desc 'Installs ruby 2.2.10'
  describe bash('sudo -H -u vagrant bash -c "source /etc/profile.d/asdf.sh && asdf list ruby"') do
    its('stdout') { should include('2.2.10') }
  end
end

control 'package' do
  title 'package resource'
  desc 'Ensure package resource is installed.'
  impact 1.0

  describe bash('sudo -H -u vagrant bash -c -l "asdf list ruby"') do
    its('stdout') { should include('2.6.3') }
    its('exit_status') { should eq 0 }
  end

  describe file('/home/vagrant/.tool-versions') do
    its('content') { should include('ruby 2.6.3') }
  end

  describe bash('sudo -H -u testuser bash -c -l "asdf list python"') do
    its('stdout') { should include('pypy3.6-7.3.1') }
    its('exit_status') { should eq 0 }
  end

  describe file('/home/testuser/.tool-versions') do
    its('content') { should include('python pypy3.6-7.3.1') }
  end
end

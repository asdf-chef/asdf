control 'plugin' do
  title 'plugin resource'
  desc 'Ensure plugin resource is installed.'
  impact 1.0

  describe bash('sudo -H -u vagrant bash -c -l "asdf plugin-list"') do
    its('stdout') { should_not include('clojure') }
  end

  describe bash('sudo -H -u vagrant bash -c -l "asdf plugin-list"') do
    its('stdout') { should include('nodejs') }
  end

  describe bash('sudo -H -u vagrant bash -c -l "asdf plugin-list"') do
    its('stdout') { should include('ruby') }
  end

  describe bash('sudo -H -u testuser bash -c -l "asdf plugin-list"') do
    its('stdout') { should include('python') }
  end
end

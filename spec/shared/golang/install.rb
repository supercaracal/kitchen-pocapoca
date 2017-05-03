shared_examples 'golang::install' do |version: '1.8.1'|
  describe command('/usr/local/go/bin/go version') do
    its(:stdout) { should contain(version) }
  end
end

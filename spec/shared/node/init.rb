shared_examples 'node::init' do |version: 'v7.0.0'|
  describe command('/home/pocapoca/.ndenv/shims/node --version') do
    its(:stdout) { should match(version) }
  end
end

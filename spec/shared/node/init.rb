shared_examples 'node::init' do
  describe command('/home/pocapoca/.ndenv/shims/node --version') do
    its(:stdout) { should match(/v4.2.2/) }
  end
end

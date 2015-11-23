shared_examples 'ruby::init' do
  describe command('/home/pocapoca/.rbenv/shims/ruby --version') do
    its(:stdout) { should contain(/ruby 2.2.3/) }
  end
end

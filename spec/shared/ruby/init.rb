shared_examples 'ruby::init' do |version: '2.3.1'|
  describe command('/home/pocapoca/.rbenv/shims/ruby --version') do
    its(:stdout) { should contain(/ruby #{version}/) }
  end
end

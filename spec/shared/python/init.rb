shared_examples 'ruby::init' do |version: '3.6.4'|
  describe command('/home/pocapoca/.pyenv/shims/python --version') do
    its(:stdout) { should contain(/Python #{version}/) }
  end
end

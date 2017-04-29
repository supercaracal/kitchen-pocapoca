shared_examples 'sudoers::savanna' do
  describe command('sudo echo hogehoge') do
    its(:stdout) { should contain('hogehoge') }
  end
end

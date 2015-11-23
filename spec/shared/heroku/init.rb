shared_examples 'heroku::init' do
  describe command('heroku version') do
    its(:stdout) { should contain('heroku-toolbelt') }
    its(:stdout) { should contain('heroku-cli') }
  end
end

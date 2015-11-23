shared_examples 'locale::init' do
  describe command(' locale | grep LANG=') do
    its(:stdout) { should match(/LANG=ja_JP.UTF-8/) }
  end

  describe file('/etc/localtime') do
    it { should be_symlink }
    it { should be_linked_to('/usr/share/zoneinfo/Japan') }
  end
end

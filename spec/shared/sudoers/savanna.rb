shared_examples 'sudoers::savanna' do |user_name|
  describe file("/etc/sudoers.d/91-#{user_name}") do
    it { should be_file }
    it { should be_owned_by('root') }
    it { should be_grouped_into('root') }
    it { should be_mode 440 }
  end
end

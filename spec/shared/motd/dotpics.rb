shared_examples 'motd::dotpics' do
  describe file('/etc/update-motd.d/99-dotpics') do
    it { should be_file }
    it { should be_owned_by('root') }
    it { should be_grouped_into('root') }
    it { should be_executable }
  end

  describe file('/etc/motds/') do
    it { should be_directory }
    it { should be_owned_by('root') }
    it { should be_grouped_into('root') }
    it { should be_mode(755) }
  end

  %w[airman bubble_slime docker dq2_allstar hagure_metal slime_allstar].each do |dotpic|
    describe file("/etc/motds/motd_#{dotpic}") do
      it { should be_file }
      it { should be_owned_by('root') }
      it { should be_grouped_into('root') }
      it { should be_mode(644) }
    end
  end
end

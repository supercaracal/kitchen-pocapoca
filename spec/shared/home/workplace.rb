shared_examples 'home::workplace' do |user_name: 'pocapoca', user_group: 'pocapoca', home_dir: '/home/pocapoca'|
  describe file("#{home_dir}/vcs") do
    it { should be_directory }
    it { should be_owned_by(user_name) }
    it { should be_grouped_into(user_group) }
    it { should be_mode(755) }
  end

  %w(tmux-colors-solarized).each do |vendor_repo|
    describe file("#{home_dir}/vcs/#{vendor_repo}") do
      it { should be_directory }
      it { should be_owned_by(user_name) }
      it { should be_grouped_into(user_group) }
      it { should be_mode(755) }
    end
  end
end

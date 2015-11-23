shared_examples 'home::bin' do |user_name: 'pocapoca', user_group: 'pocapoca', home_dir: '/home/pocapoca'|
  %w(gitvimdiff create_ctags).each do |script|
    describe file("#{home_dir}/bin/#{script}") do
      it { should be_file }
      it { should be_owned_by(user_name) }
      it { should be_grouped_into(user_group) }
      it { should be_executable }
    end
  end
end

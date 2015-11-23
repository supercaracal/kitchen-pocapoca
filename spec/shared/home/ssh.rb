shared_examples 'home::ssh' do |user_name: 'pocapoca', user_group: 'pocapoca', home_dir: '/home/pocapoca'|
  describe file("#{home_dir}/.ssh/config") do
    it { should be_file }
    it { should be_owned_by(user_name) }
    it { should be_grouped_into(user_group) }
    it { should be_mode(644) }
    its(:content) { should match(/ServerAliveInterval 15/) }
  end
end

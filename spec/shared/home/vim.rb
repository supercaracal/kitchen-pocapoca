shared_examples 'home::vim' do |user_name: 'pocapoca', user_group: 'pocapoca', home_dir: '/home/pocapoca'|
  describe file("#{home_dir}/.vim") do
    it { should be_directory }
    it { should be_owned_by(user_name) }
    it { should be_grouped_into(user_group) }
    it { should be_mode(700) }
  end

  describe file("#{home_dir}/.vim/dein/repos/github.com/Shougo/dein.vim") do
    it { should be_directory }
    it { should be_owned_by(user_name) }
    it { should be_grouped_into(user_group) }
    it { should be_mode(755) }
  end
end

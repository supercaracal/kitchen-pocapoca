shared_examples 'home::dotfile' do |user_name: 'pocapoca', user_group: 'pocapoca', home_dir: '/home/pocapoca'|
  %w[inputrc vimrc tmux.conf gitconfig Xresources gemrc].each do |dotfile|
    describe file("#{home_dir}/.#{dotfile}") do
      it { should be_file }
      it { should be_owned_by(user_name) }
      it { should be_grouped_into(user_group) }
      it { should be_mode(644) }
    end
  end
end

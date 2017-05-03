shared_examples 'golang::init' do |user_name: 'johndoe'|
  %w[bin pkg src].each do |sub_dir|
    describe file("/home/#{user_name}/.golang/#{sub_dir}") do
      it { should be_directory }
    end
  end
end

define :neobundle, user: 'root', home: '/tmp' do
  %w(.vim .vim/bundle).each do |dir|
    directory "#{params[:home]}/#{dir}" do
      owner params[:user]
      group params[:user]
      mode '0700'
      action :create
    end
  end

  git "#{params[:home]}/.vim/bundle/neobundle.vim" do
    repository 'https://github.com/Shougo/neobundle.vim.git'
    revision 'master'
    action :sync
    user params[:user]
  end

  bash "NeoBundleInstall" do
    # code 'vim +NeoBundleInstall +qall' # MinTTY hangs
    # code "#{home_dir}/.vim/bundle/neobundle.vim/bin/neoinstall" # Hmm... not working.
    user params[:user]
  end
end

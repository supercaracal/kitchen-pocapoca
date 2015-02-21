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
    user params[:user]
    group params[:user]
    repository 'https://github.com/Shougo/neobundle.vim.git'
    revision 'master'
    action :sync
  end

  bash "NeoBundleInstall" do
    user params[:user]
    group params[:user]
    # code 'vim +NeoBundleInstall +qall' # MinTTY hangs
    # code "#{home_dir}/.vim/bundle/neobundle.vim/bin/neoinstall" # Hmm... not working.
  end

  file "#{params[:home]}/#{node['ctags']['file']}" do
    owner params[:user]
    group params[:user]
    action :touch
  end

  directory "#{params[:home]}/#{node['user']['workplace']}" do
    owner params[:user]
    group params[:user]
    mode '0755'
    action :create
  end

  # cron cookbook dependency
  cron_d 'create_ctags' do
    user params[:user]
    home params[:home]
    minute '*/5'
    command "#{params[:home]}/bin/create_ctags"
  end
end

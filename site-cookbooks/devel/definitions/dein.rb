define :dein, user: 'root', home: '/tmp' do
  %w(.vim .vim/dein).each do |dir|
    directory "#{params[:home]}/#{dir}" do
      owner params[:user]
      group params[:user]
      mode '0700'
      action :create
    end
  end

  bash 'Vim Dein Install' do
    user params[:user]
    group params[:user]
    code <<-EOH
      /usr/bin/curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/vim_dein_installer.sh
      /bin/bash /tmp/vim_dein_installer.sh #{params[:home]}/.vim/dein
    EOH
  end
end

define :rbenv, user: 'root', home: '/tmp', version: '2.2.0', pkgs: [] do
  git "#{params[:home]}/.rbenv" do
    user params[:user]
    group params[:user]
    repository 'https://github.com/rbenv/rbenv.git'
    revision 'master'
    action :sync
  end

  directory "#{params[:home]}/.rbenv/plugins" do
    owner params[:user]
    group params[:user]
    mode '0755'
    action :create
  end

  git "#{params[:home]}/.rbenv/plugins/ruby-build" do
    user params[:user]
    group params[:user]
    repository 'https://github.com/rbenv/ruby-build.git'
    revision 'master'
    action :sync
  end

  bash 'rbenv init' do
    user params[:user]
    group params[:user]
    code <<-EOS
      cp /dev/null #{params[:home]}/.bash_rbenv
      echo 'export PATH="$PATH:$HOME/.rbenv/bin"' >> #{params[:home]}/.bash_rbenv
      echo 'eval "$($HOME/.rbenv/bin/rbenv init -)"' >> #{params[:home]}/.bash_rbenv
    EOS
  end

  execute "rbenv install #{params[:version]}" do
    user params[:user]
    group params[:user]
    cwd params[:home]
    environment 'HOME' => params[:home]
    creates "#{params[:home]}/.rbenv/versions/#{params[:version]}"
    command "#{params[:home]}/.rbenv/bin/rbenv install #{params[:version]}"
  end

  execute "rbenv global #{params[:version]}" do
    user params[:user]
    group params[:user]
    cwd params[:home]
    environment 'HOME' => params[:home]
    command "#{params[:home]}/.rbenv/bin/rbenv global #{params[:version]}"
  end

  execute "rbenv rehash '1st'" do
    user params[:user]
    group params[:user]
    cwd params[:home]
    environment 'HOME' => params[:home]
    command "#{params[:home]}/.rbenv/bin/rbenv rehash"
  end

  params[:pkgs].each do |pkg|
    execute "gem install #{pkg}" do
      user params[:user]
      group params[:user]
      cwd params[:home]
      environment 'HOME' => params[:home]
      not_if "#{params[:home]}/.rbenv/shims/gem which #{pkg}"
      command "#{params[:home]}/.rbenv/shims/gem install #{pkg}"
    end
  end

  execute "rbenv rehash '2nd'" do
    user params[:user]
    group params[:user]
    cwd params[:home]
    environment 'HOME' => params[:home]
    command "#{params[:home]}/.rbenv/bin/rbenv rehash"
  end
end

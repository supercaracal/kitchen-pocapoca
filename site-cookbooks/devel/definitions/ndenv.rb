define :ndenv, user: 'root', home: '/tmp', version: 'v0.12.0', pkgs: [] do
  git "#{params[:home]}/.ndenv" do
    user params[:user]
    group params[:user]
    repository 'https://github.com/riywo/ndenv.git'
    revision 'master'
    action :sync
  end

  directory "#{params[:home]}/.ndenv/plugins" do
    owner params[:user]
    group params[:user]
    mode '0755'
    action :create
  end

  git "#{params[:home]}/.ndenv/plugins/node-build" do
    user params[:user]
    group params[:user]
    repository 'https://github.com/riywo/node-build.git'
    revision 'master'
    action :sync
  end

  bash 'ndenv init' do
    user params[:user]
    group params[:user]
    code <<-EOS
      cp /dev/null #{params[:home]}/.bash_ndenv
      echo 'export PATH="$PATH:$HOME/.ndenv/bin"' >> #{params[:home]}/.bash_ndenv
      echo 'eval "$($HOME/.ndenv/bin/ndenv init -)"' >> #{params[:home]}/.bash_ndenv
    EOS
  end

  execute "ndenv install #{params[:version]}" do
    user params[:user]
    group params[:user]
    cwd params[:home]
    environment 'HOME' => params[:home]
    creates "#{params[:home]}/.ndenv/versions/#{params[:version]}"
    command "#{params[:home]}/.ndenv/bin/ndenv install #{params[:version]}"
  end

  execute "ndenv global #{params[:version]}" do
    user params[:user]
    group params[:user]
    cwd params[:home]
    environment 'HOME' => params[:home]
    command "#{params[:home]}/.ndenv/bin/ndenv global #{params[:version]}"
  end

  execute "ndenv rehash '1st'" do
    user params[:user]
    group params[:user]
    cwd params[:home]
    environment 'HOME' => params[:home]
    command "#{params[:home]}/.ndenv/bin/ndenv rehash"
  end

  params[:pkgs].each do |pkg|
    execute "npm install #{pkg}" do
      user params[:user]
      group params[:user]
      cwd params[:home]
      environment 'HOME' => params[:home]
      not_if "#{params[:home]}/.ndenv/shims/npm ls -g #{pkg}"
      command "#{params[:home]}/.ndenv/shims/npm install -g #{pkg}"
    end
  end

  execute "ndenv rehash '2nd'" do
    user params[:user]
    group params[:user]
    cwd params[:home]
    environment 'HOME' => params[:home]
    command "#{params[:home]}/.ndenv/bin/ndenv rehash"
  end
end

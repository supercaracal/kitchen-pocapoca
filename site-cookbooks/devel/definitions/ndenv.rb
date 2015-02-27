define :ndenv, user: 'root', home: '/tmp' do
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
      echo 'export PATH="$HOME/.ndenv/bin:$PATH"' >> #{params[:home]}/.bash_ndenv
      echo 'eval "$($HOME/.ndenv/bin/ndenv init -)"' >> #{params[:home]}/.bash_ndenv
    EOS
  end

  execute "ndenv install #{node['ndenv']['version']}" do
    user params[:user]
    group params[:user]
    cwd params[:home]
    environment 'HOME' => params[:home]
    creates "#{params[:home]}/.ndenv/versions/#{node['ndenv']['version']}"
    command "#{params[:home]}/.ndenv/bin/ndenv install #{node['ndenv']['version']}"
  end

  execute "ndenv global #{node['ndenv']['version']}" do
    user params[:user]
    group params[:user]
    cwd params[:home]
    environment 'HOME' => params[:home]
    command "#{params[:home]}/.ndenv/bin/ndenv global #{node['ndenv']['version']}"
  end

  execute "ndenv rehash '1st'" do
    user params[:user]
    group params[:user]
    cwd params[:home]
    environment 'HOME' => params[:home]
    command "#{params[:home]}/.ndenv/bin/ndenv rehash"
  end

  node['ndenv']['npms'].each do |npm|
    execute "npm install #{npm}" do
      user params[:user]
      group params[:user]
      cwd params[:home]
      environment 'HOME' => params[:home]
      creates "#{params[:home]}/.ndenv/shims/#{npm}"
      command "#{params[:home]}/.ndenv/shims/npm install #{npm}"
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

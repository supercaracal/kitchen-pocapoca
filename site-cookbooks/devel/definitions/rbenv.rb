define :rbenv, user: 'root', home: '/tmp' do
  git "#{params[:home]}/.rbenv" do
    user params[:user]
    group params[:user]
    repository 'https://github.com/sstephenson/rbenv.git'
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
    repository 'https://github.com/sstephenson/ruby-build.git'
    revision 'master'
    action :sync
  end

  apt_package 'libffi-dev'
  apt_package 'zlib1g-dev'
  apt_package 'libssl-dev'

  bash 'rbenv init' do
    user params[:user]
    group params[:user]
    code <<-EOS
      cp /dev/null #{params[:home]}/.bash_rbenv
      echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> #{params[:home]}/.bash_rbenv
      echo 'eval "$($HOME/.rbenv/bin/rbenv init -)"' >> #{params[:home]}/.bash_rbenv
    EOS
  end

  execute "rbenv install #{node['rbenv']['version']}" do
    user params[:user]
    group params[:user]
    cwd params[:home]
    environment 'HOME' => params[:home]
    creates "#{params[:home]}/.rbenv/versions/#{node['rbenv']['version']}"
    command "#{params[:home]}/.rbenv/bin/rbenv install #{node['rbenv']['version']}"
  end

  execute "rbenv global #{node['rbenv']['version']}" do
    user params[:user]
    group params[:user]
    cwd params[:home]
    environment 'HOME' => params[:home]
    command "#{params[:home]}/.rbenv/bin/rbenv global #{node['rbenv']['version']}"
  end

  execute "rbenv rehash" do
    user params[:user]
    group params[:user]
    cwd params[:home]
    environment 'HOME' => params[:home]
    command "#{params[:home]}/.rbenv/bin/rbenv rehash"
  end

  node['rbenv']['gems'].each do |gem|
    execute "gem install #{gem}" do
      user params[:user]
      group params[:user]
      cwd params[:home]
      environment 'HOME' => params[:home]
      creates "#{params[:home]}/.rbenv/shims/#{gem}"
      command "#{params[:home]}/.rbenv/shims/gem install #{gem}"
    end
  end

  execute "rbenv rehash" do
    user params[:user]
    group params[:user]
    cwd params[:home]
    environment 'HOME' => params[:home]
    command "#{params[:home]}/.rbenv/bin/rbenv rehash"
  end
end

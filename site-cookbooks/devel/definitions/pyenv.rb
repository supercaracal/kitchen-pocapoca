define :pyenv, user: 'root', home: '/tmp', version: '3.6.4', pkgs: [] do
  git "#{params[:home]}/.pyenv" do
    user params[:user]
    group params[:user]
    repository 'https://github.com/pyenv/pyenv.git'
    revision 'master'
    action :sync
  end

  bash 'pyenv init' do
    user params[:user]
    group params[:user]
    code <<-CODE
      cp /dev/null #{params[:home]}/.bash_pyenv
      echo 'export PYENV_ROOT="$HOME/.pyenv"' >> #{params[:home]}/.bash_pyenv
      echo 'export PATH="$PATH:$PYENV_ROOT/bin"' >> #{params[:home]}/.bash_pyenv
      echo 'eval "$($HOME/.pyenv/bin/pyenv init -)"' >> #{params[:home]}/.bash_pyenv
    CODE
  end

  execute "pyenv install #{params[:version]}" do
    user params[:user]
    group params[:user]
    cwd params[:home]
    environment 'HOME' => params[:home]
    creates "#{params[:home]}/.pyenv/versions/#{params[:version]}"
    command "#{params[:home]}/.pyenv/bin/pyenv install #{params[:version]}"
  end

  execute "pyenv global #{params[:version]}" do
    user params[:user]
    group params[:user]
    cwd params[:home]
    environment 'HOME' => params[:home]
    command "#{params[:home]}/.pyenv/bin/pyenv global #{params[:version]}"
  end

  directory "#{params[:home]}/.config/pip" do
    owner params[:user]
    group params[:user]
    mode '0755'
    action :create
    recursive true
  end

  cookbook_file "#{params[:home]}/.config/pip/pip.conf" do
    owner params[:user]
    group params[:user]
    mode '0644'
    action :create
  end

  execute "pyenv rehash '1st'" do
    user params[:user]
    group params[:user]
    cwd params[:home]
    environment 'HOME' => params[:home]
    command "#{params[:home]}/.pyenv/bin/pyenv rehash"
  end

  params[:pkgs].each do |pkg|
    execute "pip install #{pkg}" do
      user params[:user]
      group params[:user]
      cwd params[:home]
      environment 'HOME' => params[:home]
      not_if "#{params[:home]}/.pyenv/shims/pip show #{pkg}"
      command "#{params[:home]}/.pyenv/shims/pip install #{pkg}"
    end
  end

  execute "pyenv rehash '2nd'" do
    user params[:user]
    group params[:user]
    cwd params[:home]
    environment 'HOME' => params[:home]
    command "#{params[:home]}/.pyenv/bin/pyenv rehash"
  end
end

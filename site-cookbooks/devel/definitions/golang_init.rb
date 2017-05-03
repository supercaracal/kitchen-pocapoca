define :golang_init, user: 'root', home: '/tmp', pkgs: [] do
  bash 'Golang Init' do
    user params[:user]
    group params[:user]
    code <<-EOS
      cp /dev/null #{params[:home]}/.bash_golang
      mkdir -p #{params[:home]}/.golang/bin
      echo 'export GOPATH="#{params[:home]}/.golang"' >> #{params[:home]}/.bash_golang
      echo 'export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"' >> #{params[:home]}/.bash_golang
    EOS
  end

  params[:pkgs].each do |pkg|
    execute "Golang Package Install #{pkg}" do
      user params[:user]
      group params[:user]
      cwd params[:home]
      environment 'HOME' => params[:home]
      command "GOPATH=#{params[:home]}/.golang /usr/local/go/bin/go get #{pkg}"
    end
  end
end

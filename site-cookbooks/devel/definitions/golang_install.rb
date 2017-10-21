define :golang_install, version: '1.8.1' do
  bash 'Golang Install' do
    user 'root'
    group 'root'
    code <<-CODE
      /usr/bin/wget --quiet -O /tmp/go#{params[:version]}.linux-amd64.tar.gz https://storage.googleapis.com/golang/go#{params[:version]}.linux-amd64.tar.gz
      /bin/tar -C /usr/local -xzf /tmp/go#{params[:version]}.linux-amd64.tar.gz
    CODE
    creates '/usr/local/go'
  end
end

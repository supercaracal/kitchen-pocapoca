define :local_ssh, user: 'root', home: '/tmp', ssh_keys: [] do
  return if params[:ssh_keys].empty?

  directory "#{params[:home]}/.ssh" do
    owner params[:user]
    group params[:user]
    mode '0700'
    action :create
  end

  file "#{params[:home]}/.ssh/authorized_keys" do
    owner params[:user]
    group params[:user]
    content params[:ssh_keys].join("\n")
    action :create
  end

  file "#{params[:home]}/.ssh/config" do
    owner params[:user]
    group params[:user]
    content 'ServerAliveInterval 15'
    action :create
  end
end

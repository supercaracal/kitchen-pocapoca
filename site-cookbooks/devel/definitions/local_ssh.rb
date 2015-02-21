define :local_ssh, user: 'root', home: '/tmp', ssh_keys: [] do
  if params[:ssh_keys].any?
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
  end
end

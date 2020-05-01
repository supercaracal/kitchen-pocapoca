define :local_command, user: 'root', home: '/tmp', commands: [] do
  directory "#{params[:home]}/bin" do
    owner params[:user]
    group params[:user]
    mode '0700'
    action :create
  end

  params[:commands].each do |tpl|
    template "#{params[:home]}/bin/#{tpl}" do
      cookbook 'devel' # cookbook dependency
      source "bin/#{tpl}.erb"
      owner params[:user]
      group params[:user]
      mode '0544'
    end
  end

  bash 'Download git-prompt.sh' do
    user params[:user]
    group params[:user]
    code <<-CODE
      /usr/bin/curl -s -S https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > #{params[:home]}/bin/git-prompt.sh
    CODE
  end
end

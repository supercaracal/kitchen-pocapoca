define :dotfile, user: 'root', home: '/tmp', files: [] do
  params[:files].each do |tpl|
    template "#{params[:home]}/#{tpl}" do
      cookbook 'devel' # cookbook dependency
      source "dotfiles/#{tpl}.erb"
      owner params[:user]
      group params[:user]
    end
  end
end

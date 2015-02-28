define :setup_workplace, user: 'root', home: '/tmp', dir: 'workplace', tags_file: '.tags', tags_cmd: nil, repositories: [] do
  file "#{params[:home]}/#{params[:tags_file]}" do
    owner params[:user]
    group params[:user]
    action :touch
    not_if { File.exists?("#{params[:home]}/#{params[:tags_file]}") }
  end

  directory "#{params[:home]}/#{params[:dir]}" do
    owner params[:user]
    group params[:user]
    mode '0755'
    action :create
  end

  # cron cookbook dependency
  cron_d 'create_ctags' do
    user params[:user]
    home params[:home]
    minute '*/5'
    command params[:tags_cmd]
    only_if "which #{params[:tags_cmd]}"
  end

  params[:repositories].each do |repo|
    git "#{params[:home]}/#{params[:dir]}/#{repo.match(%r(([^/]+).git\z))[1]}" do
      user params[:user]
      group params[:user]
      repository repo
      revision 'master'
      action :sync
    end
  end
end

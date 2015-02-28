define :motd, script: nil, dir: '/tmp/motd', files: [] do
  directory params[:dir] do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end

  params[:files].each do |file|
    cookbook_file "#{params[:dir]}/#{file}" do
      owner 'root'
      group 'root'
      mode '0644'
      action :create
    end
  end

  template "/etc/update-motd.d/#{params[:script]}" do
    cookbook 'devel' # cookbook dependency
    source "etc/update-motd.d/#{params[:script]}.erb"
    owner 'root'
    group 'root'
    mode '0755'
    only_if { !params[:script].nil? && File.directory?('/etc/update-motd.d') }
  end
end

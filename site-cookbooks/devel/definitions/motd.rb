define :motd, files: [] do
  directory node['global']['motd']['dir'] do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end

  params[:files].each do |file|
    cookbook_file "#{node['global']['motd']['dir']}/#{file}" do
      owner 'root'
      group 'root'
      mode '0644'
      action :create
    end
  end

  template '/etc/update-motd.d/99-dotpics' do
    cookbook 'devel' # cookbook dependency
    source '99-dotpics.erb'
    owner 'root'
    group 'root'
    mode '0755'
    only_if { File.directory?('/etc/update-motd.d') }
  end
end

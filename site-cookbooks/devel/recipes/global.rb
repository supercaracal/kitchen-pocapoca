#
# Cookbook Name:: devel
# Recipe:: global
#
# Copyright 2014, PocaPocaUnty
#
# All rights reserved - Do Not Redistribute
#
node['apt']['packages'].each do |pkg|
  apt_package pkg do
    action :install
  end
end

template '/etc/postgresql/9.5/main/postgresql.conf' do
  source 'etc/postgresql/postgresql.conf.erb'
  owner 'postgres'
  group 'postgres'
  mode '0644'
end

template '/etc/postgresql/9.5/main/pg_hba.conf' do
  source 'etc/postgresql/pg_hba.conf.erb'
  owner 'postgres'
  group 'postgres'
  mode '0640'
end

bash 'update-locale' do
  user 'root'
  code "update-locale #{node['global']['lang']}"
end

link '/etc/localtime' do
  owner 'root'
  group 'root'
  to "/usr/share/zoneinfo/#{node['global']['locale']}"
end

motd do
  script node['global']['motd']['sctipt']
  dir node['global']['motd']['dir']
  files node['global']['motd']['files']
end

golang_install do
  version node['golang']['version']
end

docker_service 'default' do
  action %i[create start]
end

bash 'Docker Compose Install' do
  user 'root'
  group 'root'
  code <<-EOH
    /usr/bin/curl -L https://github.com/docker/compose/releases/download/#{node['docker']['compose']['version']}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
  EOH
  creates '/usr/local/bin/docker-compose'
end

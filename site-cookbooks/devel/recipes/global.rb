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

template "/etc/postgresql/#{node['global']['postgresql']['version']}/main/postgresql.conf" do
  source 'etc/postgresql/postgresql.conf.erb'
  owner 'postgres'
  group 'postgres'
  mode '0644'
end

template "/etc/postgresql/#{node['global']['postgresql']['version']}/main/pg_hba.conf" do
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

bash 'Docker Install' do
  user 'root'
  group 'root'
  code <<-CODE
    apt install -y -q apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu zesty stable"
    apt update -y -q
    apt install -y -q docker-ce
  CODE
  creates '/usr/bin/docker'
end

bash 'Docker Compose Install' do
  user 'root'
  group 'root'
  code <<-CODE
    /usr/bin/curl -fsSL https://github.com/docker/compose/releases/download/#{node['docker']['compose']['version']}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
  CODE
  creates '/usr/local/bin/docker-compose'
end

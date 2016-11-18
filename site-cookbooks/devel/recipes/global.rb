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

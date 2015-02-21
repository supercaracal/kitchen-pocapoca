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

bash "update-locale" do
  user 'root'
  code "update-locale #{node['global']['lang']}"
end

link "/etc/localtime" do
  owner 'root'
  group 'root'
  to "/usr/share/zoneinfo/#{node['global']['locale']}"
end

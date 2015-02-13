#
# Cookbook Name:: devel
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "git" do
  action :install
end

package "ncurses-term" do
  action :install
end

package "language-pack-ja" do
  action :install
end

bash "update-locale" do
  code 'sudo update-locale LANG=ja_JP.UTF-8'
end

link "/etc/localtime" do
  to "/usr/share/zoneinfo/Japan"
end

package "tmux" do
  action :install
end

package "curl" do
  action :install
end

template "/home/vagrant/.inputrc" do
  source ".inputrc.erb"
  owner "vagrant"
  group "vagrant"
end

template "/home/vagrant/.vimrc" do
  source ".vimrc.erb"
  owner "vagrant"
  group "vagrant"
end

template "/home/vagrant/.tmux.conf" do
  source ".tmux.conf.erb"
  owner "vagrant"
  group "vagrant"
end

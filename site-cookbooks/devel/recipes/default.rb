#
# Cookbook Name:: devel
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "ncurses-term" do
  action :install
end

package "exuberant-ctags" do
  action :install
end

package "language-pack-ja" do
  action :install
end

bash "update-locale" do
  code 'update-locale LANG=ja_JP.UTF-8'
  user "root"
end

link "/etc/localtime" do
  to "/usr/share/zoneinfo/Japan"
  owner "root"
  group "root"
end

package "git" do
  action :install
end

package "tmux" do
  action :install
end

package "curl" do
  action :install
end

directory node['vim_dir'] do
  owner "vagrant"
  group "vagrant"
  mode "0700"
  action :create
end

directory node['vim_bundle_dir'] do
  owner "vagrant"
  group "vagrant"
  mode "0700"
  action :create
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

template "/home/vagrant/.tags" do
  source ".tags.erb"
  owner "vagrant"
  group "vagrant"
end

template "/var/run/motd_pocapoca" do
  source "motd_pocapoca.erb"
  owner "root"
  group "root"
end

link "/etc/motd" do
  to "/var/run/motd_pocapoca"
  owner "root"
  group "root"
end

git "#{node['vim_bundle_dir']}/neobundle.vim" do
  repository "https://github.com/Shougo/neobundle.vim.git"
  revision "master"
  action :sync
  user "vagrant"
end

bash "NeoBundleInstall" do
  # code 'vim +NeoBundleInstall +qall' # MinTTY hangs
  code "#{node['vim_neobundle_dir']}/bin/neoinstall"
  user "vagrant"
end

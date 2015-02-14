#
# Cookbook Name:: devel
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w(ncurses-term exuberant-ctags language-pack-ja git tmux curl clisp).each do |pkg|
  package pkg do
    action :install
  end
end

%W(#{node['vim_dir']} #{node['vim_bundle_dir']}).each do |dir|
  directory dir do
    owner "vagrant"
    group "vagrant"
    mode "0700"
    action :create
  end
end

%w(.inputrc .vimrc .tmux.conf .tags).each do |tpl|
  template "/home/vagrant/#{tpl}" do
    source "#{tpl}.erb"
    owner "vagrant"
    group "vagrant"
  end
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

git "#{node['vim_bundle_dir']}/neobundle.vim" do
  repository "https://github.com/Shougo/neobundle.vim.git"
  revision "master"
  action :sync
  user "vagrant"
end

bash "NeoBundleInstall" do
  # code 'vim +NeoBundleInstall +qall' # MinTTY hangs
  code "#{node['vim_neobundle_dir']}/bin/neoinstall" # Hmm... not working.
  user "vagrant"
end

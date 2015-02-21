#
# Cookbook Name:: devel
# Recipe:: global
#
# Copyright 2014, PocaPocaUnty
#
# All rights reserved - Do Not Redistribute
#
%w(ncurses-term exuberant-ctags language-pack-ja git tmux curl tree clisp).each do |pkg|
  apt_package pkg do
    action :install
  end
end

bash "update-locale" do
  user "root"
  code 'update-locale LANG=ja_JP.UTF-8'
end

link "/etc/localtime" do
  owner "root"
  group "root"
  to "/usr/share/zoneinfo/Japan"
end

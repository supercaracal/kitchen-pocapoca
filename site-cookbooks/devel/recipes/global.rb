#
# Cookbook Name:: devel
# Recipe:: global
#
# Copyright 2014, PocaPocaUnty
#
# All rights reserved - Do Not Redistribute
#
%w(ncurses-term exuberant-ctags language-pack-ja git tmux curl tree clisp).each do |pkg|
  package pkg do
    action :install
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

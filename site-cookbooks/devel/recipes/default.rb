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

package "tmux" do
  action :install
end

package "curl" do
  action :install
end

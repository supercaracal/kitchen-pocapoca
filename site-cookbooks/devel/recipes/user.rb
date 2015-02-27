#
# Cookbook Name:: devel
# Recipe:: user
#
# Copyright 2014, PocaPocaUnty
#
# All rights reserved - Do Not Redistribute
#
data_bag('users').each do |user_id|
  user_attrs = data_bag_item('users', user_id)
  home_dir = user_attrs['home'] || "/home/#{user_id}"

  user user_id do
    password user_attrs['password']
    supports manage_home: true
    home home_dir
    shell user_attrs['shell'] || node['user']['shell']
  end

  local_ssh do
    user user_id
    home home_dir
    ssh_keys user_attrs['ssh_keys']
  end

  local_command do
    user user_id
    home home_dir
    commands node['user']['commands']
  end

  neobundle do
    user user_id
    home home_dir
  end

  rbenv do
    user user_id
    home home_dir
  end

  ndenv do
    user user_id
    home home_dir
  end

  source do
    user user_id
    home home_dir
    files node['user']['bashrc']['sources']
  end

  dotfile do
    user user_id
    home home_dir
    files node['user']['dotfiles']
  end
end

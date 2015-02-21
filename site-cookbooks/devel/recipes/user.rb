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
    shell user_attrs['shell'] || '/bin/bash'
  end

  local_ssh do
    user user_id
    home home_dir
    ssh_keys user_attrs['ssh_keys']
  end

  local_command do
    user user_id
    home home_dir
    commands %w(gitvimdiff)
  end

  dotfile do
    user user_id
    home home_dir
    files %w(.inputrc .vimrc .tmux.conf .gitconfig)
  end

  neobundle do
    user user_id
    home home_dir
  end

  %w(.tags).each do |tpl|
    file "#{home_dir}/#{tpl}" do
      owner user_id
      group user_id
      action :touch
    end
  end
end

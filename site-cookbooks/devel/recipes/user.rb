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
    manage_home true
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

  dotfile do
    user user_id
    home home_dir
    files node['user']['dotfiles']
  end

  setup_workplace do
    user user_id
    home home_dir
    dir node['user']['workplace']
    tags_file node['ctags']['file']
    tags_cmd "#{params[:home]}/bin/create_ctags"
    repositories node['user']['dependency-repositories']
  end

  source do
    user user_id
    home home_dir
    files(node['user']['bashrc']['sources'].map { |f| "#{home_dir}/#{f}" })
    destination "#{home_dir}/.bashrc"
  end

  dein do
    user user_id
    home home_dir
  end

  rbenv do
    user user_id
    home home_dir
    version node['rbenv']['version']
    pkgs node['rbenv']['gems']
  end

  ndenv do
    user user_id
    home home_dir
    version node['ndenv']['version']
    pkgs node['ndenv']['npms']
  end

  template "/etc/sudoers.d/91-#{user_id}" do
    source 'etc/sudoers.d/91-savanna'
    variables user: user_id
    owner 'root'
    group 'root'
    mode '0440'
  end
end

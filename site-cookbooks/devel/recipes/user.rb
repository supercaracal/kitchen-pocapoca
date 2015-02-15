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
  home_dir = "/home/#{user_id}"

  user user_id do
    password user_attrs['password']
    supports manage_home: true
    home user_attrs['home'] || home_dir
    shell user_attrs['shell'] || '/bin/bash'
  end

  if user_attrs['ssh_keys'].any?
    directory "#{home_dir}/.ssh" do
      owner user_id
      group user_id
      mode '0700'
      action :create
    end

    file "#{home_dir}/.ssh/authorized_keys" do
      owner user_id
      group user_id
      content user_attrs['ssh_keys'].join("\n")
      action :create
    end
  end

  %W(.vim .vim/bundle bin).each do |dir|
    directory "#{home_dir}/#{dir}" do
      owner user_id
      group user_id
      mode '0700'
      action :create
    end
  end

  %w(.inputrc .vimrc .tmux.conf .gitconfig).each do |tpl|
    template "#{home_dir}/#{tpl}" do
      source "#{tpl}.erb"
      owner user_id
      group user_id
    end
  end

  %w(gitvimdiff).each do |tpl|
    template "#{home_dir}/bin/#{tpl}" do
      source "bin/#{tpl}.erb"
      owner user_id
      group user_id
      mode '0544'
    end
  end

  %w(.tags).each do |tpl|
    file "#{home_dir}/#{tpl}" do
      content ''
      owner user_id
      group user_id
    end
  end

  git "#{home_dir}/.vim/bundle/neobundle.vim" do
    repository 'https://github.com/Shougo/neobundle.vim.git'
    revision 'master'
    action :sync
    user user_id
  end

  bash "NeoBundleInstall" do
    # code 'vim +NeoBundleInstall +qall' # MinTTY hangs
    code "#{home_dir}/.vim/bundle/neobundle.vim/bin/neoinstall" # Hmm... not working.
    user user_id
  end
end

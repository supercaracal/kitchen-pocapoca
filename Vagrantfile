# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/bionic64'
  config.vm.hostname = 'savanna'
  config.vm.network 'forwarded_port', guest: 8983, host: 8983
  config.vm.network 'forwarded_port', guest: 8080, host: 8080
  config.vm.network 'forwarded_port', guest: 3000, host: 3000

  config.vm.provider :virtualbox do |vb|
    vb.memory = '2048'
  end

  config.omnibus.chef_version = 'latest' if Vagrant.has_plugin?('vagrant-omnibus')

  config.vm.provision :chef_solo do |chef|
    chef.data_bags_path = './data_bags'
    chef.environments_path = './environments'
    chef.roles_path = './roles'
    chef.cookbooks_path = %w[./berks-cookbooks ./site-cookbooks]
    chef.add_recipe 'apt'
    chef.add_recipe 'build-essential'
    chef.add_recipe 'vim'
    chef.add_recipe 'cron'
    chef.add_recipe 'devel'
  end
end

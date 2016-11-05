# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  # Install Vagrant plugins
  required_plugins = %w( vagrant-omnibus )
  required_plugins.each do |plugin|
    system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
  end

  # Install the same version of Chef on all VMs
  config.omnibus.chef_version = '12.6.0'
  #config.omnibus.chef_version = :latest

  # Define application servers
  app_servers                 = {
      :app01 => '192.168.50.5',
      :app02 => '192.168.50.6'
  }

  # Define web servers
  web_servers                 = {
      :web01 => '192.168.50.4'
  }

  # Configure application servers
  app_servers.each do |app_server_name, app_server_ip|
    config.vm.define app_server_name do |app_config|
      app_config.vm.box      = "ubuntu/trusty64"
      app_config.vm.hostname = app_server_name.to_s
      app_config.vm.network "private_network", ip: app_server_ip
      app_config.vm.provider :virtualbox do |vb|
        vb.name   = app_server_name.to_s
        vb.memory = "512"
      end
      app_config.vm.provision "chef_solo" do |chef|
        chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
        chef.add_recipe "goapp"
      end
    end
  end

  # Configure web server (load balancer)
  web_servers.each do |web_server_name, web_server_ip|
    config.vm.define web_server_name do |web_config|
      web_config.vm.box      = "ubuntu/trusty64"
      web_config.vm.hostname = web_server_name.to_s
      web_config.vm.network "private_network", ip: web_server_ip
      web_config.vm.provider :virtualbox do |vb|
        vb.name   = web_server_name.to_s
        vb.memory = "512"
      end
      web_config.vm.provision "chef_solo" do |chef|
        chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
        chef.add_recipe "loadbalancer"
        chef.json = {
            'loadbalancer' => {
                'upstream_servers' => ["192.168.50.5:8484", "192.168.50.6:8484"]
            }
        }
      end
    end
  end
end

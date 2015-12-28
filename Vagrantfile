# -*- mode: ruby -*-
# vi: set ft=ruby ts=2 sw=2 expandtab:

Vagrant.configure(2) do |config|

  box = "ubuntu/trusty64"
  config.vm.define :rabbitmq do |rabbit_config|
    rabbit_config.vm.box = box
    rabbit_config.vm.network "private_network", ip: "192.168.50.101"
    rabbit_config.vm.provision "file", source: "src/rabbitmq/rabbitmq.config", destination: "/tmp/rabbitmq/rabbitmq.config"
    rabbit_config.vm.provision :shell, :path => "scripts/rabbitmq.sh"
    rabbit_config.vm.host_name = "rabbitmq"
  end

  config.vm.define :redis do |redis_config|
    redis_config.vm.box = box
    redis_config.vm.network "private_network", ip: "192.168.50.102"
    redis_config.vm.network "forwarded_port", guest: 6379, host: 6379
    redis_config.vm.provision :shell, :path => "scripts/redis.sh"
    redis_config.vm.host_name = "redis"
  end

  config.vm.define :sensu_server do |sensu_server_config|
    sensu_server_config.vm.box = box
    sensu_server_config.vm.network "private_network", ip: "192.168.50.103"
    sensu_server_config.vm.provision "file", source: "src/server/config.json", destination: "/tmp/sensu/config.json"
    sensu_server_config.vm.provision "file", source: "src/server/client.json", destination: "/tmp/sensu/client.json"
    sensu_server_config.vm.provision "file", source: "src/server/check_disk.json", destination: "/tmp/sensu/check_disk.json"
    sensu_server_config.vm.provision "file", source: "src/server/default_handler.json", destination: "/tmp/sensu/default_handler.json"
    sensu_server_config.vm.provision "file", source: "src/server/uchiwa.json", destination: "/tmp/sensu/uchiwa.json"
    sensu_server_config.vm.provision :shell, :path => "scripts/sensu_server.sh"
    sensu_server_config.vm.synced_folder("src", "/home/ubuntu/vagrant/sensu/src")
    sensu_server_config.vm.host_name = "sensu-server"
  end

  config.vm.define :sensu_client do |sensu_client_config|
    sensu_client_config.vm.box = box
    sensu_client_config.vm.network "private_network", ip: "192.168.50.104"
    sensu_client_config.vm.provision "file", source: "src/client/config.json", destination: "/tmp/sensu/config.json"
    sensu_client_config.vm.provision "file", source: "src/client/client.json", destination: "/tmp/sensu/client.json"
    sensu_client_config.vm.provision :shell, :path => "scripts/sensu_client.sh"
    sensu_client_config.vm.synced_folder("src", "/home/ubuntu/vagrant/sensu/src")
    sensu_client_config.vm.host_name = "sensu-client"
  end

end

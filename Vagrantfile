# -*- mode: ruby -*-
# vi: set ft=ruby ts=2 sw=2 expandtab:

Vagrant.configure(2) do |config|

  box = "ubuntu/trusty64"
  config.vm.define :rabbitmq do |rabbit_config|
    rabbit_config.vm.box = box
    rabbit_config.vm.network "private_network", ip: "192.168.50.101"
    rabbit_config.vm.provision "file", source: "src/ssl/server/cert.pem", destination: "/tmp/ssl/server/cert.pem"
    rabbit_config.vm.provision "file", source: "src/ssl/server/key.pem", destination: "/tmp/ssl/server/key.pem"
    rabbit_config.vm.provision "file", source: "src/ssl/sensu_ca/cacert.pem", destination: "/tmp/ssl/sensu_ca/cacert.pem"
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
    sensu_server_config.vm.provision "file", source: "src/ssl/server/cert.pem", destination: "/tmp/ssl/server/cert.pem"
    sensu_server_config.vm.provision "file", source: "src/ssl/server/key.pem", destination: "/tmp/ssl/server/key.pem"
    sensu_server_config.vm.provision "file", source: "src/sensu/rabbitmq.json", destination: "/tmp/sensu/rabbitmq.json"
    sensu_server_config.vm.provision "file", source: "src/sensu/client.json", destination: "/tmp/sensu/client.json"
    sensu_server_config.vm.provision "file", source: "src/server/redis.json", destination: "/tmp/server/redis.json"
    sensu_server_config.vm.provision "file", source: "src/server/api.json", destination: "/tmp/server/api.json"
    sensu_server_config.vm.provision "file", source: "src/server/dashboard.json", destination: "/tmp/server/dashboard.json"
    sensu_server_config.vm.provision :shell, :path => "scripts/sensu_server.sh"
    sensu_server_config.vm.synced_folder("src", "/home/ubuntu/vagrant/sensu/src")
    sensu_server_config.vm.host_name = "sensu-server"
  end

  config.vm.define :sensu_client do |sensu_client_config|
    sensu_client_config.vm.box = box
    sensu_client_config.vm.network "private_network", ip: "192.168.50.104"
    sensu_client_config.vm.provision "file", source: "src/ssl/client/cert.pem", destination: "/tmp/ssl/client/cert.pem"
    sensu_client_config.vm.provision "file", source: "src/ssl/client/key.pem", destination: "/tmp/ssl/client/key.pem"
    sensu_client_config.vm.provision "file", source: "src/sensu/rabbitmq.json", destination: "/tmp/sensu/rabbitmq.json"
    sensu_client_config.vm.provision "file", source: "src/sensu/client.json", destination: "/tmp/sensu/client.json"
    sensu_client_config.vm.provision :shell, :path => "scripts/sensu_client.sh"
    sensu_client_config.vm.synced_folder("src", "/home/ubuntu/vagrant/sensu/src")
    sensu_client_config.vm.host_name = "sensu-client"
  end

end

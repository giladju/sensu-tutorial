# -*- mode: ruby -*-
# vi: set ft=ruby ts=2 sw=2 expandtab:

Vagrant::Config.run do |config|

  box = "ubuntu-natty-64"
  config.vm.define :rabbitmq do |rabbit_config|
    rabbit_config.vm.box = box
    rabbit_config.vm.network :bridged, bridge: "eth0"
    rabbit_config.vm.provision :shell, :path => "scripts/rabbitmq.sh"
    rabbit_config.vm.customize do |vm|
      vm.name = "rabbitmq"
    end
  end

  config.vm.define :redis do |redis_config|
    redis_config.vm.box = box
    redis_config.vm.network :bridged, bridge: "eth0"
    redis_config.vm.provision :shell, :path => "scripts/redis.sh"
    redis_config.vm.customize do |vm|
      vm.name = "redis"
    end
  end

  config.vm.define :sensu_server do |sensu_server_config|
    sensu_server_config.vm.box = box
    sensu_server_config.vm.network :bridged, bridge: "eth0"
    sensu_server_config.vm.provision "file", source: "src/ssl/server/cert.pem", destination: "/tmp/ssl/cert.pem"
    sensu_server_config.vm.provision "file", source: "src/ssl/server/key.pem", destination: "/tmp/ssl/key.pem"
    sensu_server_config.vm.provision :shell, :path => "scripts/sensu_server.sh"
    sensu_server_config.vm.share_folder("src", "/src", "~/vagrant/sensu/src")
    sensu_server_config.vm.customize do |vm|
      vm.name = "sensu-server"
    end
  end

  config.vm.define :sensu_client do |sensu_client_config|
    sensu_client_config.vm.box = box
    sensu_client_config.vm.network :bridged, bridge: "eth0"
    sensu_client_config.vm.provision "file", source: "src/ssl/client/cert.pem", destination: "/tmp/ssl/cert.pem"
    sensu_client_config.vm.provision "file", source: "src/ssl/client/key.pem", destination: "/tmp/ssl/key.pem"
    sensu_client_config.vm.provision :shell, :path => "scripts/sensu_client.sh"
    sensu_client_config.vm.share_folder("src", "/src", "~/vagrant/sensu/src")
    sensu_client_config.vm.customize do |vm|
      vm.name = "sensu-client"
    end
  end

end

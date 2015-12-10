# -*- mode: ruby -*-
# vi: set ft=ruby ts=2 sw=2 expandtab:

Vagrant::Config.run do |config|

  box = "ubuntu-natty-64"
  config.vm.define :rabbitmq do |rabbit_config|
    #rabbit_config.vm.boot_mode = :gui
    rabbit_config.vm.box = box
    rabbit_config.vm.network("10.0.2.10")
    rabbit_config.vm.provision :shell, :path => "scripts/rabbitmq.sh"
    rabbit_config.vm.customize do |vm|
      vm.name = "rabbitmq"
    end
  end

  config.vm.define :sensu_server do |sensu_server_config|
    sensu_server_config.vm.box = box
    #sensu_server_config.vm.boot_mode = :gui
    sensu_server_config.vm.network("10.0.2.20")
    sensu_server_config.vm.provision :shell, :path => "scripts/sensu_server.sh"
    sensu_server_config.vm.share_folder("src", "/src", "~/vagrant/sensu/src")
    sensu_server_config.vm.customize do |vm|
      vm.name = "sensu-server"
    end
  end

  config.vm.define :sensu_client do |sensu_client_config|
    sensu_client_config.vm.box = box
    #sensu_client_config.vm.boot_mode = :gui
    sensu_client_config.vm.network("10.0.2.30")
    sensu_client_config.vm.provision :shell, :path => "scripts/sensu_client.sh"
    sensu_client_config.vm.share_folder("src", "/src", "~/vagrant/sensu/src")
    sensu_client_config.vm.customize do |vm|
      vm.name = "sensu-client"
    end
  end

end

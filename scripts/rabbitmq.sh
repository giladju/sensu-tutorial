cat >> /etc/apt/sources.list <<EOT
deb http://www.rabbitmq.com/debian/ testing main
EOT

wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
apt-key add rabbitmq-signing-key-public.asc

apt-get update

apt-get install -q -y screen htop vim curl wget
apt-get install -q -y rabbitmq-server

# RabbitMQ Plugins
service rabbitmq-server stop
rabbitmq-plugins enable rabbitmq_management
rabbitmq-plugins enable rabbitmq_jsonrpc
update-rc.d rabbitmq-server defaults

mkdir -p /etc/rabbitmq/ssl
cp /tmp/ssl/server/*.pem /etc/rabbitmq/ssl
cp /tmp/ssl/sensu_ca/*.pem /etc/rabbitmq/ssl
cp /tmp/rabbitmq/rabbitmq.config /etc/rabbitmq/rabbitmq.config

service rabbitmq-server start

rabbitmqctl add_vhost /sensu

rabbitmqctl add_user sensu jupass
rabbitmqctl set_permissions -p /sensu sensu ".*" ".*" ".*"

rabbitmq-plugins enable rabbitmq_management

#rabbitmq-plugins list



#wget http://www.rabbitmq.com/releases/rabbitmq-server/v2.7.1/rabbitmq-server_2.7.1-1_all.deb
#dpkg install rabbitmq-server_2.7.1-1_all.deb

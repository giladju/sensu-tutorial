cat >> /etc/apt/sources.list <<EOT
deb http://www.rabbitmq.com/debian/ testing main
EOT

wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
dpkg -i erlang-solutions_1.0_all.deb
apt-get update
apt-get -y install erlang=1:18.1

wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
apt-key add rabbitmq-signing-key-public.asc
echo "deb     http://www.rabbitmq.com/debian/ testing main" | tee /etc/apt/sources.list.d/rabbitmq.list
apt-get update
apt-get -y install rabbitmq-server

#mkdir -p /etc/rabbitmq/ssl
#cp /tmp/ssl/server/*.pem /etc/rabbitmq/ssl
#cp /tmp/ssl/sensu_ca/*.pem /etc/rabbitmq/ssl
#cp /tmp/rabbitmq/rabbitmq.config /etc/rabbitmq/rabbitmq.config

update-rc.d rabbitmq-server defaults
/etc/init.d/rabbitmq-server start

rabbitmqctl add_vhost /sensu

rabbitmqctl add_user sensu jupass
rabbitmqctl set_permissions -p /sensu sensu ".*" ".*" ".*"

#rabbitmq-plugins enable rabbitmq_management

#rabbitmq-plugins list

#wget http://www.rabbitmq.com/releases/rabbitmq-server/v2.7.1/rabbitmq-server_2.7.1-1_all.deb
#dpkg install rabbitmq-server_2.7.1-1_all.deb

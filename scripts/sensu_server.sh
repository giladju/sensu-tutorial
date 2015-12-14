echo "sensu_server"
wget -q http://repos.sensuapp.org/apt/pubkey.gpg -O- | sudo apt-key add -
echo "deb     http://repos.sensuapp.org/apt sensu main" > /etc/apt/sources.list.d/sensu.list
apt-get update
apt-get install sensu sensu-enterprise-dashboard
mkdir -p /etc/sensu/ssl
cp /tmp/ssl/server/*.pem /etc/sensu/ssl
cp /tmp/sensu/rabbitmq.json /etc/sensu/conf.d/rabbitmq.json
cp /tmp/server/redis.json /etc/sensu/conf.d/redis.json
cp /tmp/server/api.json /etc/sensu/conf.d/api.json
cp /tmp/server/dashboard.json /etc/sensu/conf.d/dashboard.json
cp /tmp/sensu/client.json /etc/sensu/conf.d/client.json
update-rc.d sensu-server defaults
update-rc.d sensu-client defaults
update-rc.d sensu-api defaults
update-rc.d sensu-dashboard defaults
/etc/init.d/sensu-server start
/etc/init.d/sensu-client start
/etc/init.d/sensu-api start
/etc/init.d/sensu-dashboard start

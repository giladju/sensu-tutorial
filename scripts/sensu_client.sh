wget -q http://repositories.sensuapp.org/apt/pubkey.gpg -O- | sudo apt-key add -
echo "deb     http://repositories.sensuapp.org/apt sensu main" | sudo tee /etc/apt/sources.list.d/sensu.list
apt-get update
apt-get install sensu
# mkdir -p /etc/sensu/ssl
# cp /tmp/ssl/client/*.pem /etc/sensu/ssl
cp /tmp/sensu/config.json /etc/sensu/config.json
# cp /tmp/sensu/rabbitmq.json /etc/sensu/conf.d/rabbitmq.json
cp /tmp/sensu/client.json /etc/sensu/conf.d/client.json
chown -R sensu:sensu /etc/sensu
update-rc.d sensu-client defaults
/etc/init.d/sensu-client start

wget -q http://repos.sensuapp.org/apt/pubkey.gpg -O- | sudo apt-key add -
echo "deb     http://repos.sensuapp.org/apt sensu main" > /etc/apt/sources.list.d/sensu.list
apt-get update
apt-get install -y sensu 
apt-get install -y uchiwa
mkdir -p /etc/sensu/conf.d
cp /tmp/sensu/config.json /etc/sensu/config.json
cp /tmp/sensu/uchiwa.json /etc/sensu/uchiwa.json
cp /tmp/sensu/client.json /etc/sensu/conf.d/client.json
cp /tmp/sensu/check_disk.json /etc/sensu/conf.d/check_disk.json
cp /tmp/sensu/default_handler.json /etc/sensu/conf.d/default_handler.json
wget -O /etc/sensu/plugins/check-disk-usage.rb https://raw.githubusercontent.com/sensu-plugins/sensu-plugins-disk-checks/master/bin/check-disk-usage.rb
chown -R sensu:sensu /etc/sensu
chmod +x /etc/sensu/plugins/check-disk-usage.rb
update-rc.d sensu-server defaults
update-rc.d sensu-client defaults
update-rc.d sensu-api defaults
update-rc.d uchiwa defaults
/etc/init.d/sensu-server start
/etc/init.d/sensu-client start
/etc/init.d/sensu-api start
/etc/init.d/uchiwa start

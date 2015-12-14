echo "sensu_client"
echo "sensu_server"
wget -q http://repos.sensuapp.org/apt/pubkey.gpg -O- | sudo apt-key add -
echo "deb     http://repos.sensuapp.org/apt sensu main" > /etc/apt/sources.list.d/sensu.list
apt-get update
apt-get install sensu
mkdir -p /etc/sensu/ssl
cp /tmp/ssl/client/*.pem /etc/sensu/ssl

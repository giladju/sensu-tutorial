apt-get update
apt-get install -q -y redis-server
/etc/init.d/redis-server stop
ETH1IP=`ifconfig eth1 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}'`
sudo sed -i "/bind 127.0.0.1/c\bind ${ETH1IP}" /etc/redis/redis.conf
/etc/init.d/redis-server start

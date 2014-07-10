#!/bin/bash
set -e
if [ ! -d /etc/nginx ]; then
	echo "Nginx does not exist. Please install OpenResty first."
	exit 99
fi

apt-get install redis-server;

ln -s $(cd "$(dirname "$0")" && pwd)/dyn-proxy /etc/nginx/sites-enabled/01-dyn-proxy;

./gen-keys redis.tvip.sandbox.bbc.co.uk;

mv ./ssl /etc/nginx;
cp ./ca.pem /etc/nginx/ssl/;

service nginx restart 

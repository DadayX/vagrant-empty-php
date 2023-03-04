#!/bin/sh
echo "update package and repository ... "
sudo apk update && apk upgrade

echo "Install Apache 2.4..."
apk add apache2
rc-service apache2 start

echo "Install php7"
apk add php7-apache2 php7-mysqli php7-json php7-session php7-phar php7-iconv php7-mbstring
rc-service apache2 restart



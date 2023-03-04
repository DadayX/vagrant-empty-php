#!/bin/sh
####################
#   
#   script: %install.sh%
#   description: % install all dependecies and packages %
#
####################

########## Install LAMP ########
echo "update package and repository ... "
sudo apk update && apk upgrade
sudo mkdir ~/bkp/
echo "Install Apache 2.4..."
sudo apk add apache2
sudo cp -p /etc/apache2/httpd.conf ~/bkp/
sudo rc-service apache2 start

echo "Install php7...."
sudo apk add php7  php7-apache2 phpmyadmin php7-json php7-session php7-phar php7-iconv php7-mbstring php7-dba php7-sqlite3  php7-mysqli php7-mysqlnd php7-pgsql php7-pdo_dblib php7-pdo_odbc php7-pdo_mysql php7-pdo_pgsql php7-pdo_sqlite php7-bcmath php7-bz2 php7-ctype php7-curl php7-dom php7-enchant php7-exif php7-fpm php7-gd php7-gettext php7-gmp php7-iconv php7-imap php7-intl php7-json php7-mbstring php7-opcache php7-openssl php7-phar php7-posix php7-pspell php7-recode php7-session php7-simplexml php7-sockets php7-sysvmsg php7-sysvsem php7-sysvshm php7-tidy php7-xml php7-xmlreader php7-xmlrpc php7-xmlwriter php7-xsl php7-zip 
sudo cp -p /etc/php*/php.ini ~/bkp/

sudo rc-service apache2 restart

echo "Install MySQL 5.7 ..."
sudo apk add mysql mysql-client
sudo cp -p /etc/mysql/my.cnf ~/bkp/


########## Install Composer ##########
echo "Install Composer........"
if [ $(echo $PATH|grep "usr/local/bin"|wc -l) -eq 0 ];then
    sudo export PATH=$PATH:/usr/local/bin
    sudo mkdir -p /usr/local/bin 
fi
sudo curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

echo "Test composer version...."
composer --version


########## Install GIT ##########
echo "Install GIT........"
sudo apk add git

########## Install Symfony ##########
echo "Install Symfony........"
if [ $(echo $PATH|grep "usr/bin"|wc -l) -eq 0 ];then
    sudo export PATH=$PATH:/usr/bin/
    sudo mkdir -p /usr/bin 
fi
sudo apk add --no-cache bash
curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | sudo -E bash
sudo apk add symfony-cli



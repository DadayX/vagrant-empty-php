#!/bin/sh
####################
#   
#   script: %updateConfig.sh%
#   description: % updateConfig Files %
#
####################

############### Apache2 Configuration update ############

echo "Mariadb Conf update........"
sudo cp /home/vagrant/conf/my.cnf /etc/mysql/
sudo chmod 640 /etc/mysql/my.cnf
sudo chown -R mysql:root /etc/mysql/my.cnf

sudo /etc/init.d/mariadb setup
sudo rc-service mariadb start
sudo apk add expect
PSWD="vagr@n1_root#"
echo "Mariadb mysql_secure_installation........"
if [ $(ps -ef|egrep "mariadb|mysql"|grep -v "grep"|wc -l) -eq 0 ];then
    sudo expect -c "
    set timeout 10
    spawn mysql_secure_installation
    expect \"Enter current password for root (enter for none):\"
    send \"\r\"
    expect \"Change the root password?\"
    send \"Y\r\"
    expect \"New password:\"
    send \"$PSWD\r\"
    expect \"Re-enter new password:\"
    send \"$PSWD\r\"
    expect \"Remove anonymous users?\"
    send \"y\r\"
    expect \"Disallow root login remotely?\"
    send \"y\r\"
    expect \"Remove test database and access to it?\"
    send \"y\r\"
    expect \"Reload privilege tables now?\"
    send \"y\r\"
    expect eof
"
fi

sudo rc-service mariadb restart
sudo rc-update add mariadb default

echo "Apache2 Conf update........"

sudo cp /home/vagrant/conf/httpd.conf /etc/apache2/httpd.conf
sudo chmod 644 /etc/apache2/httpd.conf
PSWD="vagr@n1_root#"
mysql -u root -p${PSWD} < /home/vagrant/conf/dbSecure.sql

if [ ! -d /var/www/localhost/htdocs/phpmyadmin ];then
    sudo chmod -R 777 /usr/share/webapps/phpmyadmin
    sudo chmod 755 /etc/phpmyadmin/config.inc.php
    sudo ln -s /usr/share/webapps/phpmyadmin /var/www/localhost/htdocs/phpmyadmin
    sudo rc-service apache2 restart
    #sudo rc-update apache2 default
fi
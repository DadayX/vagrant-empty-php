#!/bin/sh
#####################
#   
#   scripts:%step0.sh%
#   description: %project initialisation%
#
#####################
PROJECT_DIR=/var/www/localhost/htdocs/myagenda/
WORK_DIR=${PROJECT_DIR}/app
if [ ! -d $WORK_DIR ];then
    cd $PROJECT_DIR
    sudo symfony new app --version=4.4
fi
cd $WORK_DIR
sudo symfony server:start


# 

#DB="myagenda"
#USER="vagrant"
#PSWD="vagrant@123#"
#PROJECTCONF=$(expect -c "
#set timeout 10
#spawn mysql_secure_installation
#expect \"database_host (127.0.0.1):\"
#send \"\r\"
#expect \"database_port (null):\"
#send \"\r\"
#expect \"database_name (symfony):\"
#send \"$DB\r\"
#expect \"database_user (root):\"
#send \"$USER\r\"
#expect \"database_password (null):\"
#send \"$PSWD\r\"
#expect \"mailer_transport (smtp):\"
#send \"\r\"
#expect \"mailer_host (127.0.0.1):\"
#send \"\r\"
#expect \"mailer_user (null):\"
#send \"\r\"
#expect \"mailer_password (null):\"
#send \"\r\"
#expect \"secret (ThisTokenIsNotSoSecretChangeIt):\"
#send \"\r\"
#expect eof
#")
#
#echo "$PROJECTCONF"

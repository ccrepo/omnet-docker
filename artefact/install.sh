#!/bin/bash

PASSWORD_STATUS=$(mysql -u root -e "SELECT authentication_string FROM mysql.user WHERE user = 'root' AND host = 'localhost';" -s -N)

if [[ -z "$PASSWORD_STATUS" || "$PASSWORD_STATUS" == "NULL" ]]; then

  mysql -u root < install.sql

  mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'NNNNN';"

fi


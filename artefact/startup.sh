#!/bin/bash

trap "kill 0" SIGTERM SIGINT

# apache
apachectl -DFOREGROUND &

# ssh
#/usr/sbin/sshd -D & 

# mysql
mysqld & 

# tail
#tail -f /dev/null &

# spring boot application.
(cd /usr/local/src/omnet-server/build/libs && sleep 60 && /usr/bin/java -Dfile.encoding=UTF-8 -jar omnet-server-0.0.1.jar) &

wait -n


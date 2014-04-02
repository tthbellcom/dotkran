#!/bin/bash
ping -c 1 192.168.33.1
RC=$?

if [[ $RC -eq 0 ]] ; then 
  sed -i -e 's/mailhub=mail/mailhub=192.168.33.1:1025/' /etc/ssmtp/ssmtp.conf
else
  sed -i -e 's/mailhub=mail/mailhub=172.17.42.1:1025/' /etc/ssmtp/ssmtp.conf
fi

source /etc/apache2/envvars 
supervisord

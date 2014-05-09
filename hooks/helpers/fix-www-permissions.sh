#!/bin/bash
#
# FROM PUPPET. DONT EDIT
#
# Try to set correct permissions for files under /var/www/
#

if [ $UID -ne 0 ] ; then
  echo "Please run as root or with sudo (sudo $0)"
  exit 1
fi

PATHARRAY=( `echo ${PWD} | tr '/' ' '`)

if [[ ${PATHARRAY[1]} != 'www'  ]]; then
  echo "not in a www dir"
  exit 1
fi
PWD=`pwd`

echo "Going to recursively change group and permissionson on $PWD"
chgrp --preserve-root -R www-data "$PWD"
chmod --preserve-root -R ug+rwX "$PWD"
find "$PWD" -type d -exec chmod g+s '{}' \;

echo "Done"

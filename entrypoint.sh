#!/bin/bash

if [ ! -f /var/lib/mysql/ibdata1 ]; then
    mysql_install_db > /dev/null
fi

/bin/bash init.sh & exec /usr/bin/mysqld_safe
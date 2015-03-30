#!/bin/bash

DB_CONFIG=/usr/share/puppet-dashboard/config/database.yml

HOST=mysql
DATABASE=${MYSQL_ENV_MYSQL_DATABASE:-"dashboard"}
PORT=${MYSQL_PORT_3306_TCP_PORT:-3306}
PASS=${MYSQL_ENV_MYSQL_ROOT_PASSWORD:-"password"}

cat > $DB_CONFIG << EOF
production:
  host: ${HOST}
  database: ${DATABASE}
  username: root
  password: ${PASS}
  encoding: utf8
  adapter: mysql
EOF

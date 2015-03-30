#!/bin/bash

SCRIPT_FOLDER=/my_init

# Run init scripts
for SCRIPT in ${SCRIPT_FOLDER}/*
do
  if [ -f $SCRIPT -a -x $SCRIPT ]
  then
    $SCRIPT
  fi
done

CWD=/usr/share/puppet-dashboard
sudo -H -u puppet-dashboard rake RAILS_ENV=production db:migrate
sudo -H -u puppet-dashboard ./script/server -e production

#!/bin/bash

# Script executed every 5 min on slave to test if master is working. 
# Else slave will become master.

if ssh root@db_master01.example.com "systemctl status postgresql"; then
  exit 0
else 
  sleep 240
  if ssh root@db_master01.example.com "systemctl status postgresql"; then
    exit 0
  else
    echo "trigger" > /tmp/postgresql.trigger.5432
    exit 1
  fi
fi
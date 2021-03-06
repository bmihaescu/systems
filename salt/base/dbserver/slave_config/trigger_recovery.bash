#!/bin/bash

# Script executed every 2 min on slave to test if master is working. 
# Else slave will become master.

if sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no root@dbmaster.example.com "systemctl status postgresql"; then
  exit 0
else 
  sleep 30
  if sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no root@dbmaster.example.com "systemctl status postgresql"; then
    exit 0
  else
    echo "trigger" > /tmp/postgresql.trigger.5432
    exit 1
  fi
fi

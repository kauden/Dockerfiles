#!/bin/bash

cd /opt/xbt_tracker
./xbt_tracker
sleep 1

while true; do
  sleep 10
  pidof xbt_tracker >> /dev/null
  if [ $? -gt 0 ]; then
    exit 1
  fi
done
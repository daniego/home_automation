#!/bin/bash

apt install curl -y

export PATH=$PATH:/marytts

cd /marytts && marytts server &

echo "Starting marytts... Wait"
while true
do
  STATUS=$(curl -s -o /dev/null -w '%{http_code}' 127.0.0.1:59125/version)
  if [ $STATUS -eq 200 ]; then
    echo "Marytts Server READY!"
    break
  else
    echo "."
  fi
  sleep 0.5
done

# cd /home_automation/kalliope && kalliope start  --debug
# 2>&1
# > /var/log/kalliope.log

tail -f /var/log/*.log

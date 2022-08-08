#!/bin/bash

# check if iptables works (just warns)
set +e
iptables -L 2>/dev/null > /dev/null
if [[ $? -ne 0 ]]
then
  echo '# [!!] This image requires --cap-add NET_ADMIN'
  sleep 7
  # exit -1
fi

exec "$@"

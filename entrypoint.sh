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


# set daily cron
cat <<EOL > /etc/cron.daily/deleteVpnServerLog.sh
#!/bin/sh
find /usr/vpnserver/*_log '*.log' -mtime +30 -delete
EOL


exec "$@"

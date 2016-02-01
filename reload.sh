#!/bin/bash

PORTS=80:443
iptables -I INPUT -p tcp -m multiport --dports $PORTS --syn -j DROP

sleep 1
old_pid=$(cat /var/run/haproxy.pid)
if [ -z "$old_pid" ]; then
  old_pid=$(ps ax|grep '/usr/sbin/haprox[y]'|cut -c1-5)
fi
/usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg -sf $old_pid

iptables -D INPUT -p tcp -m multiport --dport $PORTS --syn -j DROP

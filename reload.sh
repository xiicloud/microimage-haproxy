#!/bin/bash

PORTS=80:443
iptables -I INPUT -p tcp -m multiport --dports $PORTS --syn -j DROP
sleep 1
/usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg -sf $(cat /var/run/haproxy.pid)
iptables -D INPUT -p tcp -m multiport --dport $PORTS --syn -j DROP

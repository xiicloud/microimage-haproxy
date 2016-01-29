#!/bin/bash
pidfile=/var/run/haproxy.pid
cfgfile=$1
exec /usr/local/sbin/haproxy -D -f $cfgfile -p $pidfile -sf $(cat $pidfile)

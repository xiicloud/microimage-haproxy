from microimages/alpine

run wget https://github.com/kelseyhightower/confd/releases/download/v0.10.0/confd-0.10.0-linux-amd64 -O /bin/confd \
  && chmod 755 /bin/confd \
  && apk-install haproxy iptables

add haproxy.toml /etc/confd/conf.d/haproxy.toml
add haproxy.tmpl /etc/confd/templates/haproxy.tmpl.orig
add reload.sh /

add confd_init /etc/cont-init.d/01-confd-onetime
add run_haproxy /etc/services.d/haproxy/run
add run_confd /etc/services.d/confd/run

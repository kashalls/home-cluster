#!/bin/sh

cat > /run/dnsmasq.conf.d/conditional_dns.conf <<- "EOF"
# Created by a UDM-Utilities run script
server=/consul/172.16.0.181#8600
EOF

# Restart dnsmasq so it sees the new conf file
kill -9 `cat /run/dnsmasq.pid`

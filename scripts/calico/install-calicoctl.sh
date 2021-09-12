#!/bin/sh
cd /usr/local/bin/
curl -o calicoctl -O -L  "https://github.com/projectcalico/calicoctl/releases/download/v3.20.0/calicoctl" 
chmod +x calicoctl
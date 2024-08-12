#!/bin/bash

HOSTNAME=exit-node

echo 'net.ipv4.ip_forward = 1' | tee -a /etc/sysctl.d/99-tailscale.conf
echo 'net.ipv6.conf.all.forwarding = 1' | tee -a /etc/sysctl.d/99-tailscale.conf
sysctl -p /etc/sysctl.d/99-tailscale.conf

tailscaled &

sleep 5

tailscale up --authkey=file:auth.key --hostname=$HOSTNAME --advertise-exit-node

tail -f /dev/null
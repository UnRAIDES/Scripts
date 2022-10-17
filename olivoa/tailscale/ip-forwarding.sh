#!/bin/bash
# Habilitar ip forwarding
#----
echo "Habilitando ip forwarding"
#----
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.conf
sleep 2
#----
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.conf
sleep 2
#----
sysctl -p /etc/sysctl.conf
sleep 2
echo "ip forwarding habilitado"

#!/bin/bash
ip link add dev wg0 type wireguard
ip addr add 172.29.1.1/24 dev wg0
wg set wg0 listen-port 1337 private-key /home/paul/.wireguard/privatekey
wg set wg0 peer /MQLp+MBdDqILJw8E/e8qY8aPLF/z0KFVtgceROZWxw= persistent-keepalive 180 allowed-ips 0.0.0.0/0,::/0 endpoint bastion.iosyg.com:1337
ip link set wg0 up
ip route add 172.29.0.0/24 dev wg0
ip route add 172.30.0.0/16 dev wg0
ip link set wg0 mtu 1400

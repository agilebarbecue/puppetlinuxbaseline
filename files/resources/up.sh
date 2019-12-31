#!/bin/bash
modprobe wireguard
ip link add dev wg0 type wireguard
ip addr add 172.26.1.10/24 dev wg0
wg set wg0 listen-port 14110 private-key /home/paul/.wireguard/privatekey
wg set wg0 peer z//pHvIT2rN5K8Vt4bRfXQk0bVM/lHaS3UNSYeKmsRg= persistent-keepalive 180 allowed-ips 172.26.1.0/24 endpoint 206.189.119.131:13137
ip link set wg0 up
ip route add 172.26.1.0/24 dev wg0
ip link set wg0 mtu 1400

#!/bin/sh
echo 'Make sure edit before /etc/ppp/utel.chat to correct access point'

pppd /dev/ttymxc3 115200 modem connect "/usr/sbin/chat -v -f /etc/ppp/utel.chat " defaultroute nodetach ipcp-accept-remote novj mru 1500  mtu 1500 noipdefault usepeerdns user "" password "" &

sleep 15
route add default dev ppp0
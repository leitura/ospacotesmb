#!/bin/bash
apt install firewalld

sudo firewall-cmd --zone=public --permanent --add-port=80/tcp

sudo firewall-cmd --zone=public --permanent --add-port=443/tcp

sudo firewall-cmd --reload

 wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/badvpn/badvpn-1.999.128.tar.bz2
 tar xf badvpn-1.999.128.tar.bz2

 apt install cmake

cd badvpn-1.999.128

/badvpn-1.999.128# apt install make cmake screen htop nload-y

cmake -DBUILD_NOTHING_BY_DEFAULT=1 -DBUILD_UDPGW=1

make

make

make test


make install

17

cd

rm /bin/badvpn

rm /bin/badvpn-udpgw


cp /usr/local/bin/badvpn-udpgw  /bin/badvpn-udpgw


screen -R
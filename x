#!/bin/bash
clear
Menu() {
clear
    echo -e '\n'
    echo -e "    \e[05;33mDatami\e[05m \e[01;32m@EhisOpeNer\e[05m"
    echo -e "   \e[05;32mRaj, escolhe uma carta\e[05m"
    echo -e "\033[01;32mㅤㅤㅤ \e[0m\e[01;35mCole o pacote do aplicativo\e[00m"
read x
echo ""
echo -e "\033[0m\033[01;31mㅤㅤㅤE lá vamos nós \033[05m"			
    connect
    }

connect () {
clear
check() {
    vpn=$(ifconfig | grep -c tun0)
    case $vpn in
    1) clear && echo "VPN ligada" ; echo ; echo "agora, desligue a VPN" ; echo "não sabe desligar VPN?" ; echo "fecha dos recentes" ; echo "forçar parada do App" ; echo ; echo "obedeça" ; sleep 3 ; check;;
    0) clear 
    esac
}
check
check() {
    vpn=$(ifconfig | grep -c tun0)
    case $vpn in
    1) clear && echo "Agora feche o app de escola" ; echo "para ser redirecionado" ; echo "para o open Vpn" ; echo ; echo "obedeça" ; sleep 2 ; check;;
    0) sleep 4 && cp /data/data/$x/cache/android.conf /storage/emulated/0/Download/Neymar.ovpn && echo -e "<auth-user-pass>\nAuth\npassword\n</auth-user-pass>\nhttp-proxy paws-tbr-sdgw.datami.net 8043\n--verify-client-cert none" >> /storage/emulated/0/Download/Neymar.ovpn && termux-open --chooser /storage/emulated/0/Download/Neymar.ovpn --content-type "application/x-openvpn-profile"
esac
}
check
}
clear
Menu
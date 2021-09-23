#!/bin/bash
declare -A cor=( [0]="\033[1;37m" [1]="\033[1;34m" [2]="\033[1;36m" [3]="\033[1;32m" [4]="\033[1;31m" [5]="\033[1;33m" )
barra="\033[0m\e[34m======================================================\033[1;37m"
cd
if [ $(id -u) != 0 ]
then
echo "Execute este script como root"
exit
fi

clear

echo -e "$barra"
echo -e "${cor[2]} Script  para configurar servidor para usar SSL / TLS Stunnel4"
echo -e "$barra"
echo -e "${cor[0]} Instalando Stunnel..."
echo -e "\033[1;32m "
sleep 1

rm /etc/stunnel/stunnel.conf > /dev/null 2>&1
rm /etc/default/stunnel4 > /dev/null 2>&1
apt-get purge stunnel4 -y > /dev/null 2>&1
apt-get purge stunnel -y > /dev/null 2>&1
apt-get update -y > /dev/null 2>&1
apt-get install stunnel4 -y > /dev/null 2>&1
apt-get install stunnel -y > /dev/null 2>&1
echo -e "${cor[3]} Instalado [OK!]\033[0m"
echo -e "$barra"
clear

echo -e "$barra"
echo -e "${cor[2]} C A P I T U R A N D O  I P \033[0m"
echo -e "$barra"
echo -e "\033[1;32m "
ip=$(curl https://api.ipify.org/)
echo -e "${cor[5]} IP capturado com sucesso\033[0m"
echo $ip
echo -e "$barra"
sleep 1
clear

echo -e "$barra"
echo -e "${cor[2]} Gerando Certifidado...\033[0m"
echo -e "${cor[2]} Continue pressionando Enter ..."
echo -e "$barra"
echo -e "\033[1;32m "
sleep 1
openssl genrsa 1024 > stunnel.key
openssl req -new -key stunnel.key -x509 -days 1000 -out stunnel.crt
cat stunnel.crt stunnel.key > stunnel.pem 
mv stunnel.pem /etc/stunnel/
echo > /etc/stunnel/stunnel.conf> /etc/stunnel/stunnel.conf
sleep 1

echo -e "$barra"
echo -e "${cor[2]} Selecione uma porta de redirecionamento interna"
echo -e "${cor[2]} Ou seja, uma porta em seu servidor para SSL"
echo -e "$barra"
echo -e "\033[1;32m "
read -p ": " portr
clear

echo -e "$barra"
echo -e "${cor[2]} Agora decida qual porta SSL, você vai ouvir"
echo -e "$barra"
echo -e "\033[1;32m "
read -p ": " port
clear

echo -e "cert = /etc/stunnel/stunnel.pem\nclient = no\nsocket = a:SO_REUSEADDR=1\nsocket = l:TCP_NODELAY=1\nsocket = r:TCP_NODELAY=1\n\n[stunnel]\nconnect = 127.0.0.1:$portr\naccept = $port" > /etc/stunnel/stunnel.conf

sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
clear

echo -e "$barra"
echo -e "${cor[2]} Configurado.\033[0m"
echo -e "${cor[2]} Iniciando Stunnel...\033[0m"
echo -e "$barra"
echo -e "\033[1;31m ###"
sleep 1
echo -e "\033[1;32m #########"
sleep 1
echo -e "\033[1;33m ################"
sleep 1
echo -e "\033[1;34m ########################"
sleep 1
echo -e "\033[1;35m ##################################"
sleep 1
echo -e "\033[1;32m #########"
sleep 1
echo -e "\033[1;33m ################"
sleep 1
echo -e "\033[1;34m ########################"
sleep 1
echo -e "\033[1;35m ##################################"
sleep 1

clear

echo -e "$barra"
echo -e "\033[1;32m Servidor Configurado para usar SSL/TLS Stunnel4"
echo -e "$barra"
echo -e "\033[1;31m SE NÃO FUNCIONAR, VOCÊ DEVE EXECUTAR O COMANDO: \033[1;32m sudo reboot"
echo -e "$barra"
echo -e "\033[1;32m • \033[01;34mSU IP HOST:\033[0m $ip"
echo -e "\033[1;32m • \033[01;34mPORT SSL:\033[0m $port"
echo -e "$barra"
service stunnel4 start > /dev/null 2>&1
service stunnel4 restart > /dev/null 2>&1
rm -rf $HOME/sslinstall.sh > /dev/null 2>&1
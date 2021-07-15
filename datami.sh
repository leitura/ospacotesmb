#!/bin/bash
                    # Pacote | Atividade | Nome
pacotes="br.gov.go.seduc.netescola br.gov.go.seduc.netescola.MainActivity NetEscola
org.educaolinda.app org.aprendendosempre.app.SplashScreenActivity Olinda
com.educasaoleo.reach4all com.educasaoleo.reachall.SplashScreen São Leo
com.conectauneb.reach4all com.datami.reachall.SplashScreen Conecta UNEB
br.gov.rj.rio.EscolaRioApp br.gov.rj.rio.EscolaRioApp.MainActivity Escola Rio
tv.ip.rioeduca tv.ip.my.activities.SplashScreen Rioeduca em Casa
org.cordova.quasar.corona.app org.cordova.quasar.corona.app.SplashScreenActivity Escola em Casa DF
com.portoseguru.reach4all com.datami.reachall.SplashScreen E-learning EC Porto Seguro
br.sc.gov.ciasc.sed.inp br.sc.gov.ciasc.sed.inp.MainActivity Sala Estudante SC
br.estacio.estaciomobile br.estacio.mobile.MainActivity Minha Estácio
br.gov.prodemge.conexaoescola br.gov.prodemge.conexaoescola.SplashActivity Conexão Escola 2.0
br.gov.es.sedu.educacao br.gov.es.sedu.educacao.MenuActivity EscoLAR
br.com.procergs.tuaescola br.com.procergs.tuaescola.MainActivity Escola RS - Professor
br.com.procergs.estudante br.com.procergs.estudante.MainActivity Escola RS - Estudante
com.seduc.estudeemcasa com.seduc.estudeemcasa.SplashActivity Estude em Casa
com.escola.msj com.escola.msj.SplashScreenActivity Escola MSJ
org.educarigarassu.app org.educarigarassu.app.SplashScreenActivity Educar Igarassu
com.princesaeducamais com.princesaeducamais.SplashActivity Princesa Educa+
br.gov.ba.pmvc.vcapp br.gov.ba.pmvc.vcapp.SplashScreenActivity ConquistApp
tv.ip.cmspi tv.ip.my.activities.SplashScreen CMSP Infantil e Iniciais
tv.ip.aulapr tv.ip.my.activities.SplashScreen Aula PR
tv.ip.appliquese tv.ip.my.activities.SplashScreen Applique-se
tv.ip.edusp tv.ip.my.activities.SplashScreen Centro de Mídias SP
tv.ip.conectaai tv.ip.my.activities.SplashScreen Conecta Aí
tv.ip.aulaam tv.ip.my.activities.SplashScreen Aula em Casa"
add="<auth-user-pass>\nAuth\npassword\n</auth-user-pass>\nhttp-proxy paws-tbr-sdgw.datami.net 8043\n--verify-client-cert none"
banner=" ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
 ██░▄▄▀█░▄▄▀█▄▄░▄▄█░▄▄▀██░▄▀▄░█▄░▄██
 ██░██░█░▀▀░███░███░▀▀░██░█░█░██░███
 ██░▀▀░█░██░███░███░██░██░███░█▀░▀██
 ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀\n    \e[02mhora da merenda | @EhisOpeNer\e[0m\n"
 
termux-setup-storage <<< yes
clear; echo -e "$banner"; sleep 1
echo -e "\e[07;01;37;40m PROCURANDO MODS COM ACESSO AO DATA \e[0m\n"; sleep .5

     while :; do 
        quantidade=$(wc -l <<< $pacotes)
           for i in $(seq $quantidade);
               do
                  pacote=$(cut -d ' ' -f1 <<< $(sed ""$i"p; d" <<< "$pacotes"))
                   ativid=$(cut -d ' ' -f2 <<< $(sed ""$i"p; d" <<< "$pacotes"))
                    nome=$(cut -d ' ' -f3-10 <<< $(sed ""$i"p; d" <<< "$pacotes"))
                     verif=$(egrep -o 'denied|No such file' <<< $(ls /data/user/0/$pacote 2>&1)) # permissão e existência
                 
                  echo -e "\e[07;01;37;40m APP|MOD \e[01;31;47m $nome \e[0m"
                   while :; do
                     case $verif in
                       'denied')
                               echo -e "\e[01;33m VOCÊ POSSUI O APP/MOD ✓\n MAS NÃO TEM ACESSO AO DATA!\e[0m\n \e[02mVerifique se está utilizando MODs\n Não utilize o da Playstore!\e[0m\n"; sleep 1.5; break
                              ;;
                 'No such file')
                               echo -e "\e[01;31m VOCÊ NÃO POSSUI O MOD ×\n BAIXE O APP ANTES E VOLTE A TENTAR!\e[0m\n \e[02mBaixe os MODs e tente novamente\n ou edite você mesmo o da Playstore\e[0m\n"; sleep 1; break
                              ;;
                              *) 
                               echo -e "\e[01;32m VOCÊ POSSUI ESSE APP/MOD ✓\n E TAMBÉM TEM ACESSO AO DATA!\e[0m\n"; sleep 1.5
                     esac

                     arq=$(grep android.conf -c <<< $(echo /data/user/0/$pacote/cache/*))
                       case $arq in
                            1)
                             echo -e "\e[01;37m VOCÊ JA POSSUI O ARQUIVO OVPN DELE\n E O ARQUIVO SERÁ USADO NO OPENVPN\n CASO QUEIRA PULAR PARA OS PRÓXIMOS APPS\n SÓ APERTAR QUALQUER TECLA 10s...\e[0m\n"; sleep 2
                             apert=$(echo -e "\e[02m aperte qualquer tecla para pular\e[0m")
                             read -t10 -p "$apert"
                                pare=$(echo $?)
                                     case $pare in
                                          0) echo; break;;
                                          142) echo; $(tput cuu 4 > /dev/null 2>&1; tput dl 4 > /dev/null 2>&1) || echo
                                     esac
                             while :; do 
                              net=$(ifconfig | egrep "wlan0|rmnet5|rmnet_data1|tun0" -o | tr -d ' \n')
                              echo -e "\e[01;33m\n $net \n\e[0m"
                                case $net in
                                    wlan0)
                                           echo -e "\e[01;33mDESLIGUE O SEU WIFI, E ATIVE OS DADOS MÓVEIS!\e[0m"; sleep 1
                                         $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                         sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                         ;;
                         rmnet_data1wlan0)
                                           echo -e "\e[01;33mDESLIGUE O SEU WIFI, E DEIXE SOMENTE OS DADOS ATIVOS!\e[0m"; sleep 1
                                         $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                         sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                         ;;
                     rmnet_data1tun0wlan0)
                                           echo -e "\e[01;33mDESLIGUE O SEU WIFI&VPN, E DEIXE SOMENTE OS DADOS MÓVEIS!\e[0m"; sleep 1
                                         $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                         sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                         ;;
                          rmnet_data1tun0) 
                                           echo -e "\e[01;33mDESLIGUE A VPN, E DEIXE SOMENTE OS DADOS MÓVEIS!\e[0m"; sleep 1
                                         $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                         sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                         ;;
                              rmnet_data1) break
                                         ;;
                                         
                                   rmnet5) break
                                         ;;
                               rmnet5tun0) 
                                           echo -e "\e[01;33mDESLIGUE A VPN, E DEIXE SOMENTE OS DADOS MÓVEIS!\e[0m"; sleep 1
                                         $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                         sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                         ;;
                              rmnet5wlan0)
                                           echo -e "\e[01;33mDESLIGUE O SEU WIFI, E DEIXE SOMENTE OS DADOS ATIVOS!\e[0m"; sleep 1
                                         $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                         sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                         ;;
                          rmnet5tun0wlan0)
                                           echo -e "\e[01;33mDESLIGUE O SEU WIFI&VPN, E DEIXE SOMENTE OS DADOS MÓVEIS!\e[0m"; sleep 1
                                         $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                         sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                         ;;
                                        *)
                                           echo -e "\e[01;33mATIVE OS DADOS MÓVEIS PARA CONTINUAR!\e[0m"; sleep 1
                                         $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                         sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                esac
                             done
                             echo -e "\e[07;01;37;40m $nome \e[01;31;47m TENTANDO CONEXÃO COM O ARQUIVO \e[0m\n \e[01;33m• INICIE A CONEXÃO DO ARQUIVO E AGUARDE!\e[0m\n \e[02m Aguarde que tudo será automático!\n  só iniciar a conexão quando o app abrir\e[0m"; sleep 5
                             cp /data/user/0/$pacote/cache/android.conf ~/android.ovpn
                             echo -e "$add" >> android.ovpn
                             termux-open --chooser ~/android.ovpn --content-type "application/x-openvpn-profile"
                             sleep 1

                             end=$((SECONDS+23))
                             while [ $SECONDS -lt $end ]; do 
                             ney=1
                              net=$(ifconfig | egrep "wlan0|rmnet5|rmnet_data1|tun0" -o | tr -d ' \n')
                                case $net in
                                    wlan0)
                                           echo -e "\e[01;33mDESLIGUE O SEU WIFI, E ATIVE OS DADOS MÓVEIS!\e[0m"; sleep 1
                                         $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                         sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                         ;;
                         rmnet_data1wlan0)
                                           echo -e "\e[01;33mDESLIGUE O SEU WIFI, E DEIXE SOMENTE OS DADOS ATIVOS!\e[0m"; sleep 1
                                         $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                         sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                         ;;
                     rmnet_data1tun0wlan0)
                                           echo -e "\e[01;33mDESLIGUE O SEU WIFI&VPN, E DEIXE SOMENTE OS DADOS MÓVEIS!\e[0m"; sleep 1
                                         $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                         sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                         ;;
                              rmnet_data1)
                                           echo -e "\e[01;33mVERIFICANDO SE HOUVE SUCESSO NA CONEXÃO...\e[0m"; sleep 5
                                         ;;
                          rmnet_data1tun0) ney=0; break
                                         ;;
                               rmnet5tun0) ney=0; break
                                         ;;
                                   rmnet5)
                                           echo -e "\e[01;33mVERIFICANDO SE HOUVE SUCESSO NA CONEXÃO...\e[0m"; sleep 5
                                         ;;
                              rmnet5wlan0)
                                           echo -e "\e[01;33mDESLIGUE O SEU WIFI, E DEIXE SOMENTE OS DADOS ATIVOS!\e[0m"; sleep 1
                                         $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                         sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                         ;;
                          rmnet5tun0wlan0)
                                           echo -e "\e[01;33mDESLIGUE O SEU WIFI&VPN, E DEIXE SOMENTE OS DADOS MÓVEIS!\e[0m"; sleep 1
                                         $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                         sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                         ;;
                                        *)
                                           echo -e "\e[01;33mATIVE OS DADOS MÓVEIS PARA CONTINUAR!\e[0m"; sleep 1
                                         $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                         sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                esac
                                   
                            done; case $ney in
                                        1) echo -e "\n\e[01;33m NÃO IDENTIFICAMOS CONEXÃO VPN\n CONTINUANDO PARA OS PRÓXIMOS APPS\e[0m\n \e[02mProvavelmente o arquivo já expirou\e[0m"; $(am start -n com.termux/com.termux.HomeActivity > /dev/null 2>&1); sleep 2;;
                                        0) echo -e "\e[01;32m OK SUCESSO NA CONEXÃO!\e[0m"; sleep 3; exit
                                   esac;  break

                             ;;
                            *) 
                              echo -e "\e[02m Porém não encontramos o arquivo.conf!\e[0m\n\n\e[01;33m AGORA IREMOS INICIAR O APP/MOD!\n PARA QUE O ARQUIVO SEJA GERADO\e[0m"; sleep 2
                              apert=$(echo -e "\e[02m aperte qualquer tecla para pular esse app 10s\e[0m")
                             read -t10 -p "$apert"
                                pare=$(echo $?)
                                     case $pare in
                                          0) echo; break;;
                                          142) echo; $(tput cuu 4 > /dev/null 2>&1; tput dl 4 > /dev/null 2>&1) || echo
                                     esac
                             while :; do 
                              net=$(ifconfig | egrep "wlan0|rmnet5|rmnet_data1|tun0" -o | tr -d ' \n')
                                case $net in
                                    wlan0)
                                           echo -e "\e[01;33mDESLIGUE O SEU WIFI, E ATIVE OS DADOS MÓVEIS!\e[0m"; sleep 1
                                         $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                         sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                         ;;
                         rmnet_data1wlan0)
                                           echo -e "\e[01;33mDESLIGUE O SEU WIFI, E DEIXE SOMENTE OS DADOS ATIVOS!\e[0m"; sleep 1
                                         $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                         sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                         ;;
                     rmnet_data1tun0wlan0)
                                           echo -e "\e[01;33mDESLIGUE O SEU WIFI&VPN, E DEIXE SOMENTE OS DADOS MÓVEIS!\e[0m"; sleep 1
                                         $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                         sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                         ;;
                              rmnet_data1) 
                                           echo -e "\e[01;37m VERIFICANDO SE HOUVE SUCESSO NA CONEXÃO...\e[0m"; sleep 1
                                           $(am start -n $pacote/$ativid > /dev/null 2>&1)
                                           end=$((SECONDS+20))
                                           while [ $SECONDS -lt $end ]; do 
                                            net=$(ifconfig | egrep "wlan0|rmnet_data1|tun0" -o | tr -d ' \n')
                                             case $net in
                                      rmnet_data1tun0) echo -e "\e[01;32m OK SUCESSO NA CONEXÃO!\e[0m"; $(am start -n com.termux/com.termux.HomeActivity > /dev/null 2>&1); sleep 2; echo -e "\e[01;33m AGORA FECHE O APP/MOD ESCOLA!\e[0m"; sleep 5
                                           while :; do
                                            net=$(ifconfig | egrep "wlan0|rmnet_data1|tun0" -o | tr -d ' \n')
                                             case $net in
                                      rmnet_data1tun0) echo -e "\e[02m DESLIGUE A CONEXÃO VPN DO APP/MOD\e[0m"; $(am start -n com.termux/com.termux.HomeActivity > /dev/null 2>&1); sleep 5;;
                                                   *) break
                                             esac
                                           done
                                           arq=$(grep android.conf -c <<< $(echo /data/user/0/$pacote/cache/*))
                                             case $arq in
                                                  1);;
                                                  *) echo -e "\e[01;31m O ARQUIVO NÃO FOI GERADO!\n MODIFIQUE O APP OU BAIXE UM NOVO!\e[0m\n\n \e[02m continuando para os próximos apps/mods\e[0m"; sleep 3; break
                                             esac
                                           echo -e "\n\e[07;01;37;40m $nome \e[01;31;47m TENTANDO CONEXÃO COM O ARQUIVO \e[0m\n \e[01;33m• INICIE A CONEXÃO DO ARQUIVO E AGUARDE!\e[0m\n \e[02m Aguarde que tudo será automático!\n  só iniciar a conexão quando o app abrir\e[0m\n"; sleep 3
                                           cp /data/user/0/$pacote/cache/android.conf ~/android.ovpn
                                           echo -e "$add" >> android.ovpn
                                           termux-open --chooser ~/android.ovpn --content-type "application/x-openvpn-profile"
                                           sleep 1

                                           end=$((SECONDS+20))
                                           while [ $SECONDS -lt $end ]; do 
                                            net=$(ifconfig | egrep "wlan0|rmnet_data1|tun0" -o | tr -d ' \n')
                                              case $net in
                                                 wlan0)
                                                       echo -e "\e[01;33mDESLIGUE O SEU WIFI, E ATIVE OS DADOS MÓVEIS!\e[0m"; sleep 1
                                                       $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                                       sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                                      ;;
                                      rmnet_data1wlan0)
                                                       echo -e "\e[01;33mDESLIGUE O SEU WIFI, E DEIXE SOMENTE OS DADOS ATIVOS!\e[0m"; sleep 1
                                                       $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                                       sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                                      ;;
                                  rmnet_data1tun0wlan0)
                                                       echo -e "\e[01;33mDESLIGUE O SEU WIFI&VPN, E DEIXE SOMENTE OS DADOS MÓVEIS!\e[0m"; sleep 1
                                                       $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                                       sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                                     ;;
                                      rmnet_data1tun0) echo -e "\e[01;32m OK SUCESSO NA CONEXÃO!\e[0m"; sleep 3; exit
                                                     ;;
                                          rmnet_data1)
                                                      echo -e "\e[01;33mVERIFICANDO SE HOUVE SUCESSO NA CONEXÃO...\e[0m"; sleep 5
                                                     ;;
                                                    *)
                                                       echo -e "\e[01;33mATIVE OS DADOS MÓVEIS PARA CONTINUAR!\e[0m"; sleep 1
                                                       $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                                       sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                              esac
                                           done; echo -e "\n\e[01;33m NÃO IDENTIFICAMOS CONEXÃO VPN\n CONTINUANDO PARA OS PRÓXIMOS APPS\e[0m"; $(am start -n com.termux/com.termux.HomeActivity > /dev/null 2>&1); sleep 2; break;;
                                                    *)
                                             esac
                                           done; break
                                         ;;
                                   rmnet5)
                                           echo -e "\e[01;37m VERIFICANDO SE HOUVE SUCESSO NA CONEXÃO...\e[0m"; sleep 1
                                           $(am start -n $pacote/$ativid > /dev/null 2>&1)
                                           end=$((SECONDS+20))
                                           while [ $SECONDS -lt $end ]; do 
                                            net=$(ifconfig | egrep "wlan0|rmnet5|rmnet_data1|tun0" -o | tr -d ' \n')
                                             case $net in
                                      rmnet_data1tun0) echo -e "\e[01;32m OK SUCESSO NA CONEXÃO!\e[0m"; $(am start -n com.termux/com.termux.HomeActivity > /dev/null 2>&1); sleep 2; echo -e "\e[01;33m AGORA FECHE O APP/MOD ESCOLA!\e[0m"; sleep 5
                                           while :; do
                                            net=$(ifconfig | egrep "wlan0|rmnet5|rmnet_data1|tun0" -o | tr -d ' \n')
                                             case $net in
                                      rmnet_data1tun0) echo -e "\e[02m DESLIGUE A CONEXÃO VPN DO APP/MOD\e[0m"; $(am start -n com.termux/com.termux.HomeActivity > /dev/null 2>&1); sleep 5;;
                                                   *) break
                                             esac
                                           done
                                           arq=$(grep android.conf -c <<< $(echo /data/user/0/$pacote/cache/*))
                                             case $arq in
                                                  1);;
                                                  *) echo -e "\e[01;31m O ARQUIVO NÃO FOI GERADO!\n MODIFIQUE O APP OU BAIXE UM NOVO!\e[0m\n\n \e[02m continuando para os próximos apps/mods\e[0m"; sleep 3; break
                                             esac
                                           echo -e "\n\e[07;01;37;40m $nome \e[01;31;47m TENTANDO CONEXÃO COM O ARQUIVO \e[0m\n \e[01;33m• INICIE A CONEXÃO DO ARQUIVO E AGUARDE!\e[0m\n \e[02m Aguarde que tudo será automático!\n  só iniciar a conexão quando o app abrir\e[0m\n"; sleep 3
                                           cp /data/user/0/$pacote/cache/android.conf ~/android.ovpn
                                           echo -e "$add" >> android.ovpn
                                           termux-open --chooser ~/android.ovpn --content-type "application/x-openvpn-profile"
                                           sleep 1

                                           end=$((SECONDS+20))
                                           while [ $SECONDS -lt $end ]; do 
                                            net=$(ifconfig | egrep "wlan0|rmnet5|rmnet_data1|tun0" -o | tr -d ' \n')
                                              case $net in
                                                 wlan0)
                                                       echo -e "\e[01;33mDESLIGUE O SEU WIFI, E ATIVE OS DADOS MÓVEIS!\e[0m"; sleep 1
                                                       $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                                       sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                                      ;;
                                      rmnet_data1wlan0)
                                                       echo -e "\e[01;33mDESLIGUE O SEU WIFI, E DEIXE SOMENTE OS DADOS ATIVOS!\e[0m"; sleep 1
                                                       $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                                       sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                                      ;;
                                  rmnet_data1tun0wlan0)
                                                       echo -e "\e[01;33mDESLIGUE O SEU WIFI&VPN, E DEIXE SOMENTE OS DADOS MÓVEIS!\e[0m"; sleep 1
                                                       $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                                       sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                                     ;;
                                      rmnet_data1tun0) echo -e "\e[01;32m OK SUCESSO NA CONEXÃO!\e[0m"; sleep 3; exit
                                                     ;;
                                          rmnet_data1)
                                                      echo -e "\e[01;33mVERIFICANDO SE HOUVE SUCESSO NA CONEXÃO...\e[0m"; sleep 5
                                                     ;;
                                                    *)
                                                       echo -e "\e[01;33mATIVE OS DADOS MÓVEIS PARA CONTINUAR!\e[0m"; sleep 1
                                                       $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                                       sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                              esac
                                           done; echo -e "\n\e[01;33m NÃO IDENTIFICAMOS CONEXÃO VPN\n CONTINUANDO PARA OS PRÓXIMOS APPS\e[0m"; $(am start -n com.termux/com.termux.HomeActivity > /dev/null 2>&1); sleep 2; break;;
                                                    *)
                                             esac
                                           done; break
                                         ;;
                              rmnet5wlan0)
                                           echo -e "\e[01;33mDESLIGUE O SEU WIFI, E DEIXE SOMENTE OS DADOS ATIVOS!\e[0m"; sleep 1
                                         $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                         sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                         ;;
                          rmnet5tun0wlan0)
                                           echo -e "\e[01;33mDESLIGUE O SEU WIFI&VPN, E DEIXE SOMENTE OS DADOS MÓVEIS!\e[0m"; sleep 1
                                         $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                         sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                         ;;
                               rmnet5tun0) 
                                           echo -e "\e[01;33mDESLIGUE A VPN, E DEIXE SOMENTE OS DADOS MÓVEIS!\e[0m"; sleep 1
                                         $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                         sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                         ;;
                          rmnet_data1tun0)
                                           echo -e "\e[01;33mDESLIGUE A VPN, E DEIXE SOMENTE OS DADOS MÓVEIS!\e[0m"; sleep 1
                                         $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                         sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                        ;;
                                          *)
                                             echo -e "\e[01;33mATIVE OS DADOS MÓVEIS PARA CONTINUAR!\e[0m"; sleep 1
                                         $(am start -n com.android.phone/com.android.phone.DefaultNetworkSettingsDialogActivity > /dev/null 2>&1)
                                         sleep 5; $(tput cuu1 > /dev/null 2>&1; tput dl1 > /dev/null 2>&1)
                                esac
                             done; break
                       esac
                   done
                 case $i in
                   $quantidade) exit
                 esac
           done
     done
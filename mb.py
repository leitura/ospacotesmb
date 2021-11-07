#!/usr/bin/python
import os
import time
import requests
import json
import requests
from requests.structures import CaseInsensitiveDict

BRANCO='\033[1;29m'
VermelhoAll='\e[01;37;41m'
NADA='\033[0m'
CINZA='\033[02;37m'
DESTACAR='\033[01;37m'
RED='\033[1;31m'
AZUL='\033[36m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
AMARELO='\033[33m'
SCOLOR='\033[0m'
SEMCOR='\033[8m'
BrancoAll='\033[03;37;47m'
LETRAPRETA='\033[02;30;47m'
PURPULA='\033[35m'
OLAMAE =f"ㅤﾠㅤ⣿⣿⣿⣿⣿⠁⢰⠂⠐⠋⠊⠄⠂⢰⣆⠄⠂⠤⠄⡨⡀⠄⠄⠄⠄⠄⠠⠠\nﾠㅤㅤ⣿⣿⣿⣿⣿⠇⠄⠈⠄⠄⠄⠄⠄⠄⢸⣿⠄⠄⠄⠄⠄⠁⠄⠄⠄⠄⠄⠠\nㅤㅤﾠ⣿⣿⣿⣿⡟⠄⠄⠄⠄⡀⡄⠠⢀⣤⣿⣿⠄⠄⠄⠄⠄⢐⠄⠄⠄⠄⠄⠠\nㅤㅤﾠ⣿⣿⣿⣿⠁⠄⠸⠄⠄⢿⣷⣬⣿⣿⣿⣿⣀⣹⡤⡀⠄⢰⠄⠄⠄⠄⠄⠠\nㅤㅤﾠ⣿⣿⣿⠇⠄⠄⠄⠄⠄⠘⣿⣿⣿⡿⢼⣿⣿⣿⠁⠄⠄⢸⠄⠄⠄⠄⠄⠠\nㅤㅤﾠ⣿⣿⠏⠄⠄⠄⠄⠄⠄⠄⠈⠻⣿⣆⣾⡿⠛⠁⠄⠄⠄⠄⡄⠄⠄⠄⠄⠠\nㅤㅤﾠ⣿⡏⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠛⠁⠄⠄⠄⠄⠄⠄⠄⢃⠄⠄⠄⠄⠄ \nㅤㅤﾠ⡟⠄⣀⣤⣤⣄⠄⣠⣀⣀⣀⣀⠄⠄⠄⠄⠄⠄⡀⠄⣀⣀⣘⠄⠄⠄⠄⠄ \nㅤㅤﾠ⠄⣾⣿⣿⣿⡟⢰⣿⣿⣿⣿⣷⣷⣶⣿⣾⣿⣿⡇⢻⣿⣿⣿⣿⡄⠄⠄⠄ \nㅤㅤﾠ⠄⣿⣿⣿⡏⠃⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣌⢟⡯⡟⣿⣷⠄⠄⠄ \nㅤㅤﾠ⠄⢹⣿⣿⢁⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣜⠿⠂⠄⠄ \nㅤㅤﾠ⠄⠄⢿⠇⣼⣿⣿⢿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⡷⡀⠄⠄ \nㅤㅤﾠ⠄⠄⠘⢐⣿⣿⠄⠄⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠄⢰⠘⡀ \nㅤㅤﾠ⠄⠄⠄⢸⣿⣿⣷⣶⣿⣿⣿⣿⣿⣿⢻⣟⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⠄⠄ \nㅤㅤﾠ⠄⠄⠄⠄⠻⣿⣿⣿⣿⣿⣿⣿⡿⣻⣿⣟⣾⠿⣿⣿⣿⣿⣿⣿⡿⠃⠠⠄ \nㅤㅤﾠ⢀⢐⡀⣤⣤⣬⣝⣛⣻⣟⣿⢭⣿⣿⡿⣿⣿⣿⣮⣼⣟⠻⣿⡝⠄⠄⠄⠠"

def Main():
 os.system('clear')
 print(f"{OLAMAE}")
 print(f"                    {GREEN}MB Free     {NADA}")
 print(f"{DESTACAR}{AZUL}[ 1 ] - {PURPULA}Vivo{NADA}")
 print(f"{DESTACAR}{AZUL}[ 2 ] - {AMARELO}Oi{NADA}")
 print(f"{DESTACAR}{AZUL}[ 0 ] - {RED}Sair, tenho medo{AZUL}")
 print()
 option = input(f"Raj, escolhe uma carta{NADA} ")

 print()
 print()

 if( option == '1' or option == '01'):
  os.system('clear')
  OPERADORA = "VIVO"
  BANNER = f"ㅤﾠㅤ⣿⣿⣿⣿⣿⠁⢰⠂⠐⠋⠊⠄⠂⢰⣆⠄⠂⠤⠄⡨⡀⠄⠄⠄⠄⠄⠠⠠\nﾠㅤㅤ⣿⣿⣿⣿⣿⠇⠄⠈⠄⠄⠄⠄⠄⠄⢸⣿⠄⠄⠄⠄⠄⠁⠄⠄⠄⠄⠄⠠\nㅤㅤﾠ⣿⣿⣿⣿⡟⠄⠄⠄⠄⡀⡄⠠⢀⣤⣿⣿⠄⠄⠄⠄⠄⢐⠄⠄⠄⠄⠄⠠\nㅤㅤﾠ⣿⣿⣿⣿⠁⠄⠸⠄⠄⢿⣷⣬⣿⣿⣿⣿⣀⣹⡤⡀⠄⢰⠄⠄⠄⠄⠄⠠\nㅤㅤﾠ⣿⣿⣿⠇⠄⠄⠄⠄⠄⠘⣿⣿⣿⡿⢼⣿⣿⣿⠁⠄⠄⢸⠄⠄⠄⠄⠄⠠\nㅤㅤﾠ⣿⣿⠏⠄⠄⠄⠄⠄⠄⠄⠈⠻⣿⣆⣾⡿⠛⠁⠄⠄⠄⠄⡄⠄⠄⠄⠄⠠\nㅤㅤﾠ⣿⡏⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠛⠁⠄⠄⠄⠄⠄⠄⠄⢃⠄⠄⠄⠄⠄ \nㅤㅤﾠ⡟⠄⣀⣤⣤⣄⠄⣠⣀⣀⣀⣀⠄⠄⠄⠄⠄⠄⡀⠄⣀⣀⣘⠄⠄⠄⠄⠄ \nㅤㅤﾠ⠄⣾⣿⣿⣿⡟⢰⣿⣿⣿⣿⣷⣷⣶⣿⣾⣿⣿⡇⢻⣿⣿⣿⣿⡄⠄⠄⠄ \nㅤㅤﾠ⠄⣿⣿⣿⡏⠃⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣌⢟⡯⡟⣿⣷⠄⠄⠄ \nㅤㅤﾠ⠄⢹⣿⣿⢁⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣜⠿⠂⠄⠄ \nㅤㅤﾠ⠄⠄⢿⠇⣼⣿⣿⢿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⡷⡀⠄⠄ \nㅤㅤﾠ⠄⠄⠘⢐⣿⣿⠄⠄⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠄⢰⠘⡀ \nㅤㅤﾠ⠄⠄⠄⢸⣿⣿⣷⣶⣿⣿⣿⣿⣿⣿⢻⣟⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⠄⠄ \nㅤㅤﾠ⠄⠄⠄⠄⠻⣿⣿⣿⣿⣿⣿⣿⡿⣻⣿⣟⣾⠿⣿⣿⣿⣿⣿⣿⡿⠃⠠⠄ \nㅤㅤﾠ⢀⢐⡀⣤⣤⣬⣝⣛⣻⣟⣿⢭⣿⣿⡿⣿⣿⣿⣮⣼⣟⠻⣿⡝⠄⠄⠄⠠{NADA}\n{PURPULA}MBS {OPERADORA}{NADA}\n"
  print(f"{BANNER}")
  print(f"{DESTACAR}{AZUL}[ 1 ] - {AMARELO}Ganhar MB automático{NADA}")
  print(f"{DESTACAR}{AZUL}[ 2 ] - {GREEN}Ganhar MB usando um accessPass Vivo{NADA}")
  print(f"{DESTACAR}{AZUL}[ 0 ] - {RED}Voltar{AZUL}")
  print()
   
  passi = input(f"Raj, escolhe uma carta{NADA} ")
 
  if passi == "1":
    os.system('clear')
    print(f"{BANNER}")
    print(f"{RED}Sem wi-fi, sem vpn, apenas dados móveis do chip\n{AMARELO}Vivo{NADA} para prosseguir {GREEN} sctoken{NADA} rodar os\n{GREEN}ads liberando MB{NADA}\n\n")
    time.sleep(5)
    peo = input(f"{NADA}Tecle na tecla {GREEN}ENTER{NADA} do seu teclado Xing Ling")
    print()
   
    try:    
     access = json.loads(requests.post('http://i.vivo.ddivulga.com/i/gp' , data = {'version' : '2'}).text)
     sctoken = access['sctoken']
    except:
     os.system('clear')
     print(f"{BANNER}\n{RED}Nada de trapaças{NADA}")
     time.sleep(5)
     Main()

  elif passi == "2":
     os.system('clear')
     print(f"{BANNER}")
     sctoken = input(f"{AZUL}Cole um accessPass Vivo{GREEN} ")
  elif passi == "0":
     exit()
  else:
     Main()
   
 
  UrlReward="http://e.vivo.ddivulga.com/api/clickEvent"
  data = f"slotId=%5B%7B%22slotId%22%3A%22101%22%2C%22target%22%3A%22os%3Dandroid%3BtailCity%3Dmanaus%3BtailtState%3Damazonas%3BtailCountry%3Dbr%22%7D%2C%7B%22slotId%22%3A%22102%22%2C%22target%22%3A%22os%3Dandroid%3BtailCity%3Dmanaus%3BtailtState%3Damazonas%3BtailCountry%3Dbr%22%7D%2C%7B%22slotId%22%3A%22103%22%2C%22target%22%3A%22os%3Dandroid%3BtailCity%3Dmanaus%3BtailtState%3Damazonas%3BtailCountry%3Dbr%22%7D%2C%7B%22slotId%22%3A%22104%22%2C%22target%22%3A%22os%3Dandroid%3BtailCity%3Dmanaus%3BtailtState%3Damazonas%3BtailCountry%3Dbr%22%7D%5D&pageId=660224&insertionId=&insertionUUID=&insertionType=&referer=http%3A%2F%2Finternetgratis.vivo.com.br%2F&accessPass={sctoken}"
  url = "http://e.vivo.ddivulga.com/api/v2.1/fetch"
  headers = CaseInsensitiveDict()
  headers["Origin"] = "http://a.vivo.ddivulga.com"
  headers["Content-Type"] = "application/x-www-form-urlencoded"
  reapit=999
   
  
  
 elif( option == '2' or option == '02'):
  OPERADORA = "OI  "
  BANNER = f"ㅤﾠㅤ⣿⣿⣿⣿⣿⠁⢰⠂⠐⠋⠊⠄⠂⢰⣆⠄⠂⠤⠄⡨⡀⠄⠄⠄⠄⠄⠠⠠\nﾠㅤㅤ⣿⣿⣿⣿⣿⠇⠄⠈⠄⠄⠄⠄⠄⠄⢸⣿⠄⠄⠄⠄⠄⠁⠄⠄⠄⠄⠄⠠\nㅤㅤﾠ⣿⣿⣿⣿⡟⠄⠄⠄⠄⡀⡄⠠⢀⣤⣿⣿⠄⠄⠄⠄⠄⢐⠄⠄⠄⠄⠄⠠\nㅤㅤﾠ⣿⣿⣿⣿⠁⠄⠸⠄⠄⢿⣷⣬⣿⣿⣿⣿⣀⣹⡤⡀⠄⢰⠄⠄⠄⠄⠄⠠\nㅤㅤﾠ⣿⣿⣿⠇⠄⠄⠄⠄⠄⠘⣿⣿⣿⡿⢼⣿⣿⣿⠁⠄⠄⢸⠄⠄⠄⠄⠄⠠\nㅤㅤﾠ⣿⣿⠏⠄⠄⠄⠄⠄⠄⠄⠈⠻⣿⣆⣾⡿⠛⠁⠄⠄⠄⠄⡄⠄⠄⠄⠄⠠\nㅤㅤﾠ⣿⡏⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠛⠁⠄⠄⠄⠄⠄⠄⠄⢃⠄⠄⠄⠄⠄ \nㅤㅤﾠ⡟⠄⣀⣤⣤⣄⠄⣠⣀⣀⣀⣀⠄⠄⠄⠄⠄⠄⡀⠄⣀⣀⣘⠄⠄⠄⠄⠄ \nㅤㅤﾠ⠄⣾⣿⣿⣿⡟⢰⣿⣿⣿⣿⣷⣷⣶⣿⣾⣿⣿⡇⢻⣿⣿⣿⣿⡄⠄⠄⠄ \nㅤㅤﾠ⠄⣿⣿⣿⡏⠃⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣌⢟⡯⡟⣿⣷⠄⠄⠄ \nㅤㅤﾠ⠄⢹⣿⣿⢁⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣜⠿⠂⠄⠄ \nㅤㅤﾠ⠄⠄⢿⠇⣼⣿⣿⢿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⡷⡀⠄⠄ \nㅤㅤﾠ⠄⠄⠘⢐⣿⣿⠄⠄⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠄⢰⠘⡀ \nㅤㅤﾠ⠄⠄⠄⢸⣿⣿⣷⣶⣿⣿⣿⣿⣿⣿⢻⣟⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⠄⠄ \nㅤㅤﾠ⠄⠄⠄⠄⠻⣿⣿⣿⣿⣿⣿⣿⡿⣻⣿⣟⣾⠿⣿⣿⣿⣿⣿⣿⡿⠃⠠⠄ \nㅤㅤﾠ⢀⢐⡀⣤⣤⣬⣝⣛⣻⣟⣿⢭⣿⣿⡿⣿⣿⣿⣮⣼⣟⠻⣿⡝⠄⠄⠄⠠{NADA}\n{AMARELO}MBS {OPERADORA}{NADA}\n"
  os.system('clear')
  print(f"{BANNER}")
  print(f"{DESTACAR}{AZUL}[ 1 ] - {AMARELO}Ganhar MB automático{NADA}")
  print(f"{DESTACAR}{AZUL}[ 2 ] - {GREEN}Ganhar MB usando um sctoken Oi{NADA}")
  print(f"{DESTACAR}{AZUL}[ 0 ] - {RED}Voltar{AZUL}")
  print()
   
  passi = input(f"Raj, escolhe uma carta{NADA} ")
 
  if passi == "1":
    os.system('clear')
    print(f"{BANNER}")
    print(f"{RED}Sem wi-fi, sem vpn, apenas dados móveis do chip\n{AMARELO}Oi{NADA} para prosseguir {GREEN} sctoken{NADA} rodar os\n{GREE}ads liberando MB{NADA}\n\n")
    time.sleep(5)
    peo = input(f"{NADA}Tecle na tecla {GREEN}ENTER{NADA} do seu teclado Xing Ling")
    print()
    UrlReward="http://e.oi.ddivulga.com/api/clickEvent"

    try:    
     access = json.loads(requests.post('http://e.oi.ddivulga.com/api/gp' , data = {'version' : '2'}).text)
     sctoken = access['sctoken']
     
    except:
     os.system('clear')     
     print(f"{BANNER}\n{RED}Nada de trapaças{NADA}")
     time.sleep(5)
     Main()
 
  elif passi == "2":
     os.system('clear')
     print(f"{BANNER}")
     sctoken = input(f"{AZUL}Cole um sctoken Oi{GREEN} ")
  elif passi == "0":
     exit()
  else:
     Main()
     
  UrlReward="http://e.oi.ddivulga.com/api/clickEvent"
  data = f"slotId=%5B%7B%22slotId%22%3A301%2C%22target%22%3A%22os%3Dandroid%3BtailCity%3Dmanaus%3BtailtState%3Damazonas%3BtailCountry%3Dbr%22%7D%5D&pageId=822068&insertionId=&insertionUUID=&insertionType=ANY&referer=&accessPass={sctoken}"
  url = "http://e.oi.ddivulga.com/api/v2.1/fetch"
  headers = CaseInsensitiveDict()
  headers["Origin"] = "http://e.oi.ddivulga.com"
  headers["Content-Type"] = "application/x-www-form-urlencoded"
  reapit=9999
   
   

 elif option == "0":
     exit()
 else:
   os.system('clear')
   Main()

 buscar(BANNER, url, headers, data, RED, GREEN, NADA, sctoken, reapit, UrlReward)

 
def buscar(BANNER, url, headers, data, RED, GREEN, NADA, sctoken, reapit, UrlReward):
 os.system('clear')
 print(f"{BANNER}\n{AMARELO}Mães solteiras a 39m...{NADA}")
 time.sleep(4)
 try:
  fetch = requests.post(url, headers=headers, data=data).text
  X9deToken = json.loads(fetch)

 except:
  os.system('clear')
  print(f"{BANNER}\n{RED}Nada de trapaças{NADA}")
  time.sleep(5)
  Main()

 advid = [ ]
 impressionid = [ ]
 tokens_on = 0
 iu = 0
 AdvName = [ ]
 AdvReward = [ ]
 AdvMensagem = [ ]

 while iu < 18:
  iu = iu + 1
 
  try:
   advid.append(X9deToken[f'10{iu}']['advId'])
   
   
  
   impressionid.append(X9deToken[f'10{iu}']['impressionEventId'])
   
   AdvName.append(X9deToken[f'10{iu}']['advName'])
   
   AdvReward.append(X9deToken[f'10{iu}']['rewardWebMessage2'])
   
   tokens_on = tokens_on + 1
  
  except:
   pass
   
 Numero = X9deToken['msisdn']
 if tokens_on == '0':
   os.system('clear')
   print(f"{BANNER}")
   print(f"{GREEN}{tokens_on} ads dando sopa{NADA}")
   print()
   print(f"{GREEN}Número:{NADA} {GREEN}{Numero}{NADA}")
   print()
   print(f"{DESTACAR}{AZUL}[ 0 ] - {RED}Voltar {PURPULA}hoje não é seu dia de sorte{AZUL}")
   print()
   resl = input(f"Raj, escolhe uma carta{NADA} ")
   Main()
 else:
   os.system('clear')
   print(f"{BANNER}")
   print(f"{GREEN}{tokens_on} ads dando sopa{NADA}")
   print()
   print(f"{GREEN}Número:{NADA} {GREEN}{Numero}{NADA}")
   print()
   print(f"{DESTACAR}{AZUL}[ 1 ] - {AMARELO}Ganhar MB {GREEN}é hora do show{NADA}")
   print(f"{DESTACAR}{AZUL}[ 0 ] - {RED}Voltar {PURPULA}Chip fuleiro{AZUL}")
   print()
   resl = input(f"Raj, escolhe uma carta{NADA} ")
   
   if resl == '1':
     print()
     
   else:
     Main()

 headers = CaseInsensitiveDict()
 headers["Content-Type"] = "application/x-www-form-urlencoded"

 testador = 0
 testestokens = 0


 Envio(BANNER, NADA, LETRAPRETA, advid, impressionid, GREEN, RED, Numero, tokens_on, testador, testestokens, sctoken, reapit, headers, AdvName, AdvReward, UrlReward)


def Envio(BANNER, NADA, LETRAPRETA, advid, impressionid, GREEN, RED, Numero, tokens_on, testador, testestokens, sctoken, reapit, headers, AdvName, AdvReward, UrlReward):

 for token in range(tokens_on):
  
  testador = testador + 1
  print()
  print(f"{NADA}{LETRAPRETA}           Localizar Pai {testador}           {NADA}")
  print(f"{YELLOW}Adv Name: {AdvName[token]}")
  print(f"ImpressionID: {impressionid[token]}")
  print(f"AdvID: {advid[token]}{NADA}")
   
  try:
    contagem = 0
    while contagem < reapit:
      
      time.sleep(0.7)
      contagem = contagem + 1
      
      resp = requests.post(UrlReward, headers=headers, data=f"advId={advid[token]}&eventImpressionId={impressionid[token]}&apass={sctoken}").text
      
      if 'evtClickId' in resp:
        print(f"{GREEN}aumentando sinal - {contagem}{NADA}")
      
      else:
        print(f"{RED}Pai não encontrado{NADA}")
        time.sleep(4)
        contagem = reapit
  except:
    pass

 os.system('clear')
 testestokens = testestokens + 1
 print(f"{BANNER}")
 print(f"{GREEN}Número: {GREEN}{Numero}{NADA}")
 print(f"{DESTACAR}{AZUL}Ganhar MB nestes tokens {GREEN}{testestokens}{NADA}")
 print()
 print(f"{DESTACAR}{AZUL}[ 1 ] - {AMARELO}Ganhar mais MB {GREEN}até bloquear{NADA}")
 print(f"{DESTACAR}{AZUL}[ 0 ] - {RED}Voltar {PURPULA}Chip fuleiro{AZUL}")
 print()
 option = input(f"Raj, escolhe uma carta{NADA} ")
 
 if option == '1':
    testador = 0
    Envio(BANNER, NADA, LETRAPRETA, advid, impressionid, GREEN, RED, Numero, tokens_on, testador, testestokens, sctoken, reapit, headers, AdvName, AdvReward, UrlReward)
 
 else:
    testador = 0
    Main()

Main()

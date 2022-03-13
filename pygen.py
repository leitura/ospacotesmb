import base64

def linha():
    print('□■'*20)


while True:
    menu = int(input('''
   \033[1;31;48m 

    ██████╗░██╗░░░██╗░██████╗░███████╗███╗░░██╗
    ██╔══██╗╚██╗░██╔╝██╔════╝░██╔════╝████╗░██║
    ██████╔╝░╚████╔╝░██║░░██╗░█████╗░░██╔██╗██║
    ██╔═══╝░░░╚██╔╝░░██║░░╚██╗██╔══╝░░██║╚████║
    ██║░░░░░░░░██║░░░╚██████╔╝███████╗██║░╚███║
    ╚═╝░░░░░░░░╚═╝░░░░╚═════╝░╚══════╝╚═╝░░╚══╝seminovo

    [1] SSL

    [2] WEBSOCKET

    [3] SSL + PAYLOAD

    [4] SAIR
    
    :'''))
    if menu == 1 :

        nome = str(input('Nome da Payload: \n'))
        linha()
        dominio = str(input('Domínio: \n'))
        linha()
        tipo = str(input('Tipo de Payload \n ex: SSL + PAYLOAD :\n'))
        linha()
        proxy = str(input('PROXY: \n'))
        linha()
        sni = str(input('SNI: \n'))
        linha
        dnsP = str(input('DNS PRIMARIO: \n'))
        linha()
        dnsS = str(input('DNS SECUNDARIO: \n'))
        linha()
        porta = str(input('Porta: \n'))
        linha()
        teg = str(input('teg: \n'))
        linha()
        udp = str(input('UDP: \n'))
        linha()
        lista = str(input("Nome da lista:"))

        pay = nome+"!!!!"+tipo+"!!!!GET / HTTP/1.1[crlf]Host:"+dominio+"[crlf]Upgrade: websocket[crlf][crlf]!!!!"+proxy+"!!!!"+dnsP+"!!!!"+dnsS+"!!!!!!!!"+porta+"!!!!0!!!!0!!!!"+teg+"!!!!1!!!!1!!!!!!!!!!!!"+sni+"!!!!127.0.0.1:+udp+((((((######"+lista+"!!!!1((((((######0######--------FfiB3ReRbCKY@@@@@@@@@@@@"
        code = base64.b64encode(pay.encode('utf-8'))
        print('\033[1;31;43m',code[::-1])

    elif menu == 2:
        nome = str(input('Nome da Payload: \n')) 
        linha()
        dominio = str(input('Domínio: \n'))
        linha() 
        tipo = str(input('Tipo de Payload \n ex: SSL + PAYLOAD :\n'))
        linha()
        proxy = str(input('PROXY: \n'))
        linha()
        sni = str(input('SNI: \n'))
        linha
        dnsP = str(input('DNS PRIMARIO: \n'))
        linha()
        dnsS = str(input('DNS SECUNDARIO: \n'))
        linha()
        porta = str(input('Porta: \n'))
        linha()
        teg = str(input('teg: \n'))
        linha()
        udp = str(input('UDP: \n'))
        linha()
        lista = str(input("Nome da lista:"))

        pay = nome+"!!!!"+tipo+"!!!!GET / HTTP/1.1[crlf]Host:"+dominio+"[crlf]Upgrade: websocket[crlf][crlf]!!!!"+proxy+"!!!!"+dnsP+"!!!!"+dnsS+"!!!!!!!!"+porta+"!!!!0!!!!0!!!!"+teg+"!!!!1!!!!1!!!!!!!!!!!!"+"!!!!127.0.0.1:+udp+((((((######"+lista+"!!!!1((((((######0######--------FfiB3ReRbCKY@@@@@@@@@@@@"
        code = base64.b64encode(pay.encode('utf-8'))
        print('\033[1;31;43m',code[::-1])


    elif menu == 3:
        nome = str(input('Nome da Payload: \n'))            
        linha()                                               
        dominio = str(input('Domínio: \n'))                  
        linha()                                               
        tipo = str(input('Tipo de Payload \n ex: SSL + PAYLOAD :\n'))                                               
        linha()                                               
        proxy = str(input('PROXY: \n'))                      
        linha()
        sni = str(input('SNI: \n'))
        linha
        dnsP = str(input('DNS PRIMARIO: \n'))
        linha()
        dnsS = str(input('DNS SECUNDARIO: \n'))
        linha()
        porta = str(input('Porta: \n'))
        linha()
        teg = str(input('teg: \n'))
        linha()
        udp = str(input('UDP: \n'))
        linha()
        lista = str(input("Nome da lista:"))

        pay = nome+"!!!!"+tipo+"!!!!GET wss://"+sni+"/ HTTP/1.1[crlf]Host:"+dominio+"[crlf]Upgrade: websocket[crlf][crlf]!!!!"+proxy+"!!!!"+dnsP+"!!!!"+dnsS+"!!!!!!!!"+porta+"!!!!0!!!!0!!!!"+teg+"!!!!1!!!!1!!!!!!!!!!!!"+sni+"!!!!127.0.0.1:+udp+((((((######"+lista+"!!!!1((((((######0######--------FfiB3ReRbCKY@@@@@@@@@@@"
        code = base64.b64encode(pay.encode('utf-8'))
        print('\033[1;31;43m',code[::-1])
    elif menu == 4:
        break
    else:
        print('''
\n\n\n\n\n\n
░█▀▀▀█ ░█▀▀█ ░█▀▀█ ─█▀▀█ ░█▀▀▀█
░█──░█ ░█▄▄█ ░█─── ░█▄▄█ ░█──░█
░█▄▄▄█ ░█─── ░█▄▄█ ░█─░█ ░█▄▄▄█

▀█▀ ░█▄─░█ ░█──░█ ─█▀▀█ ░█─── ▀█▀ ░█▀▀▄ ░█▀▀▀█
░█─ ░█░█░█ ─░█░█─ ░█▄▄█ ░█─── ░█─ ░█─░█ ░█──░█
▄█▄ ░█──▀█ ──▀▄▀─ ░█─░█ ░█▄▄█ ▄█▄ ░█▄▄▀ ░█▄▄▄█\n\n\n''')

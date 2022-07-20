import json, os

def gerador(contador=0):
	os.system('clear')
	if contador == 0:
		print('Pequeno Gerador Conecta4G\nNoob Sofre\n')
	nome = input('\nnome da config: ')
	flag = input("\nSua flag - bandeira, ex. br: ")
	sni = input("\nSua sni: ")
	tlsip = input("\nSeu tlsIP: ")
	prip = input("\nSeu proxyIP: ")
	prpt = input("\nSeu proxyPort: ")
	info = input("\nSua info: ")
	payload = f"GET wss://{sni} HTTP/1.1[crlf]Host: [app_host][crlf]Connection: Upgrade[crlf]Upgrade: Websocket[crlf][crlf]"	
	resultado = json.dumps({"Name": nome, 
	"FLAG": flag,
	"Payload": payload,
	"SNI": sni,
	"TlsIP": tlsip,
	"ProxyIP": prip,
	"ProxyPort": prpt,
	"Info": info}, indent=4,)
	return resultado

def main():
	contador = 0
	a = gerador(contador)
	while True:
		b = int(input("Criar mais uma configuracao:\n0-->Nao\n1-->Sim\n--> "))
		if b == 1:
			contador += 1
			c = gerador(contador)
			a += f',{c}'
		else:
			print(a)
			break

main()
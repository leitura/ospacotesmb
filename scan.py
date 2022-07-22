import socket,re
import threading
import sys
import ipaddress
from os import system as s
bg=''

G = bg+'\033[32m'
O = bg+'\033[33m'
GR = bg+'\033[37m'
R = bg+'\033[31m'

cg = '\033[92m'
cp = '\033[35m'
clb = '\033[94m'
cb = '\033[34m'
k = '\033[0m'
clr = '\033[91m'
ver = '@Ver 1.0 LTS'
		
def save(x):
	with open('status101.txt','a') as fl:
		fl.write(str(x)+'\n')
		fl.close()
		
def scanner(host,domain):
	sock=socket.socket()
	sock.settimeout(2)
	try:
		sock.connect((str(host),80))
		payload='GET / HTTP/1.1\r\nHost: {}\r\n\r\n'.format(host)
		sock.send(payload.encode())
		response=sock.recv(1024).decode('utf-8','ignore')
		for data in response.split('\r\n'):
			data=data.split(':')
			if re.match(r'HTTP/\d(\.\d)?' ,data[0]):
				print('response status : {}{}{}'.format(O,data[0],GR))
			if data[0]=='Server':
				try:
					if data[1] ==' cloudflare':
						print('{}server : {}\nFound working {}..'.format(G,host,GR))
						save(f'{host} === opened')
						payloadsnd(host,domain)
				except Exception as e:
					print(e)
	except Exception as e:print(e)

def auto_replace(server,ip):
	packet = server.recv(1024).decode('utf-8','ignore')
	status = packet.split('\n')[0]
	if re.match(r'HTTP/\d(\.\d)? 101',status):
		print(f'{O}[TCP] response : {G}{status}{GR}')
		save(f'{ip} response ==== {status}')
	else:
		if re.match(r'HTTP/\d(\.\d)? \d\d\d ',status):
			server.send(b'HTTP/1.1 200 Connection established\r\n\r\n')
			print(f'{O}[TCP] response : {R}{status}{GR}')
			return auto_replace(server,ip)
	print('==== ==== ==== ==== ==== ==== ==== ==== ==== ====')

def payloadsnd(ip,domain):
	#domain = 'ca.sshws.net'
	port =80
	sc=socket.socket()
	sc.connect((str(ip),port))
	payload=f'GET / HTTP/1.0[crlf]Host: {domain}[crlf][crlf]'
	payload=payload.replace('[crlf]','\r\n')
	sc.send(payload.encode())
	auto_replace(sc,ip)

def Main():
	try:
		domain = input(
			f'{clb}[ {cp}01 {clb}]{k} Digite o Dominio \n{cg}|\n└──{k}Dominio {cg}:{k} ')
		print()
		range = input(
			f'{clb}[ {cp}02 {clb}]{k} Digite IP e intervalo no formato " 192.0.0.0/24 " \n{cg}|\n└──{k}IP {cg}:{k} ')
		if range == '':
			print('Noob sofre')
			sys.exit(1)
	except:
		print('mando pegar o pacote e você ferra tudo')
		sys.exit(1)

	try:
		net4 = ipaddress.ip_network(range)
	except ValueError as e:
		print(f'\n{clr}fodeu{k}: ' + str(e))
		print()
		sys.exit(1)

	v = 0
	for x in net4.hosts():
		v = v + 1

	print(f'\n{clb}DIGITALIZANDO{k}: {range}\n{clb}Total de hosts no intervalo{k}: {v}\n')
	
	enter = input(
			f'{clb}{cp} Enter para continuar {cg}:{k} ')

	y=0
	for host in net4.hosts():
		try:
			y = y + 1
			print(' {} | {} '.format(y,v))
			print(
			f'{clb}{cp}IP {cg}: {host}{k} ')
			sc=threading.Thread(scanner(host,domain))
			sc.start()
		except KeyboardInterrupt:
			break

	
if __name__=="__main__":
	s('clear')
	Main()
#!/usr/bin/python3
"""
-> Feito por: Gabriel Jose
-> Criei este script para me auxiliar no "simulado" da DESEC de hashes
"""
import crypt


def deCrypt():
	wordList = input("[+] Coloque o caminho da wordList: ")
	fullHash = input("[+] Digite a hash(crypt) completa: ")
	hash = fullHash.split("$")
	salt = f"${hash[1].strip()}${hash[2].strip()}$"
	hashPasswd = hash[3::]
	passwd = ""
	find = False
	if len(hashPasswd) > 0:
		for i in hashPasswd:
			passwd += i
	else:
		passwd = hashPasswd[0]
	if wordList != "":
		print("[+] Aguarde...")
		with open(fr"{wordList}", "r") as file:
			for i in file.readlines():
				i = i.rstrip()
				print(f"[+] Tentando com a senha: {i}", end="\r")
				hashGenerate = crypt.crypt(i, salt)
				#print(f"Hash da senha {i}: {hashGenerate}", end="\r")
				if hashGenerate == fullHash:
					find = True
					print(f"\n[+] Senha encontrada: {i}")
					break
	if not find:
		print("[-] Não foi possivel encontrar a senha :/")


deCrypt()

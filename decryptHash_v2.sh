#!/bin/bash


BLUE="\033[0;34m"
GREEN="\033[0;32m"
RED="\033[0;31m"
PURPLE="\033[0;35m"
YELLOW="\033[1;33m"
NC="\033[0m"

wordList=""
hash=""
typeHash=""

setWordList() {
	local selectWordList="0"
	#wordList=""

	echo -e "$YELLOW[*] Use our wordList or yours:"
	echo -e "$PURPLE	[+] 1 - Our WordList"
	echo -e "	[+] 2 - Your WordList"
	read -p "$(echo -e -n "$NC Select Option: ")" resp
	case $resp in
		"2")
			read -p "$(echo -e -n "$YELLOW[+] Set your WordList: ")" answer
			#read answer
			wordList="$answer"
		;;
		"1")
			echo -e "$GREEN[+] WordList select: $PURPLE 10M_password.txt"
			wordList="10M_password.txt"
		;;
		*)
			echo -e "$RED[-] Choose only one of the options above"
			echo -e "$YELLOW bye!"
			exit 0
		;;
		esac
}

main() {

#ARRAY=()
stop="1"
count=0

while [ $stop -eq "1" ]
do
	if [ $count == 0 ]
	then
		echo -e "$BLUE============================"
		echo -e "$PURPLE[*] Decrypt Password Hash"
		echo -e "$PURPLE[*] by: Gabriel"
		echo -e "$BLUE============================"
		echo -e ""
		echo -e ""
	else
		echo -e ""
	fi
	echo -e "$BLUE============================"
	echo -e "$YELLOW[*] OPTIONS:"
	if [ "$wordList" == "" ]
	then
		echo -e "$PURPLE	[+] 1 - Set wordlist"
	else
		echo -e "$PURPLE	[+] 1 - Set wordlist: $wordList"
	fi
	if [ "$hash" == "" ]
	then
		echo -e "	[+] 2 - Set Hash"
	else
		echo -e "	[+] 2 - Set Hash: $hash"
	fi
	if [ "$typeHash" == "" ]
	then
		echo -e "	[+] 3 - Set type Hash"
	else
		echo -e "	[+] 3 - Set type Hash: $typeHash"
	fi
	echo -e "	[+] 4 - Help"
	echo -e "	[+] 5 - Exit"
	echo -e "$BLUE============================"
	read -p "$( echo -e -n "$NC Select Option: ")" returnUser

	case $returnUser in
		"1")
			setWordList
			#echo "$wordList"
		;;
		"2")
			read -p "$( echo -e -n "$NC Set Hash: ")" returnHash
			hash=$returnHash
		;;
		"3")
			read -p "$( echo -e -n "$NC Set type Hash: ")"  returnTypeHash
			typeHash=$returnTypeHash
		;;
		"4")
			echo -n "Help"
		;;
		"5")
			echo -n "$PURPLEbye!"
			exit 0
		;;
		*)
			echo -e "$REDJust choose the options above"
			echo -e "$PURPLE bye!"
			exit 0
		;;
	esac # FIm do switch case

	if [ "$wordList" != "" ] &&  [ "$hash" != "" ] && [ "$typeHash" != "" ];
	then
		stop="0"
		findPassw="0"
		echo -e "$PURPLE [+] Processing...."
		for i in $(cat $wordList);
		do
			passwdHash=$(echo -n "$i" | $typeHash | cut -d " " -f 1)
			#echo "$passwdHash"
			if [ "$passwdHash" == "$hash" ]
			then
				findPassw="1"
				echo -e "$PURPLE [+] Password found: $GREEN $i"
				echo -e "$GREEN [+] Thank you for using this tool, bye <3"
				break
			fi
		done
		if [ "$findPassw" == "0" ]
		then
			echo -e "$RED [-] Could not find password with requested hash"
		fi
		exit 0
		#echo "$passwd"
	fi
	let count++
	done # Fim do loop while
}

main
#echo "$?"

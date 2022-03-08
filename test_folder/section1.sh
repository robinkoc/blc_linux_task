#!/bin/bash

myvar=$(ls -cl | sed '1d' | tr -s ' ' | cut -d ' ' -f 6,7,8)
myvar2=$(ls -cl | sed '1d' | tr -s ' ' | cut -d ' ' -f 6,7,8)
while true
do	
	if [ "$myvar" != "$myvar2" ]
	then
		ssmtp r510vdeneme@gmail.com < change_mail.txt	
	fi
	myvar=$myvar2
	sleep 180
	myvar2=$(ls -cl | sed '1d' | tr -s ' ' | cut -d ' ' -f 6,7,8)
done


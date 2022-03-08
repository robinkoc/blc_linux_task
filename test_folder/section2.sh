#!/bin/bash

while true
do
	echo -ne "HTTP/1.1 200 OK/r/n"
	echo "test_folder last change:"  > ./temp.txt
	echo -e | ls -lt --time-style=+"%Y-%m-%d %H:%M:%S" | grep -v "temp.txt" | sed '1d' | tr -s ' ' | cut -d ' ' -f 8 | head -1 >> ./temp.txt
	echo "at the time:"  >> ./temp.txt
	echo -e |ls -lt --time-style=+"%Y-%m-%d %H:%M:%S" | grep -v "temp.txt" | sed '1d' | tr -s ' ' | cut -d ' ' -f 7 | head -1 >> ./temp.txt
	cat ./temp.txt | nc -l -k -p 8080 -q 1

done

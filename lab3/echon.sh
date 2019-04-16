#!/bin/bash
if [ "$#" -eq "2" ]
then
	if [ "$(echo "$1" | egrep -v '[a-z]')" ] &&  [ "$1" -gt "-1" ] 
	then
		n=0
		while [ $n -lt "$1" ]
		do 
			echo "$2"
			n=$(( $n+1 ))
		done
	else
		echo "./echon.sh: argument 1 must be a non-negative integer"
	fi
else
	echo "Usage: ./echon.sh <number of lines> <string>"
fi

#!/bin/sh

smallest=$1
largest=$(($2+1))
num=$smallest

while [ $num -lt $largest ]
do
	echo "$num" >> $3
	num=$(($num + 1))
done

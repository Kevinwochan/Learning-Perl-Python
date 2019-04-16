#!/bin/sh

for file in "$@"
do
	display "$file"
	echo -n "Address to e-mail this image to? "
	read address
	echo -n "Message to accompany image? "
	read message
	echo "$file sent to $address"
	echo "$message" | mutt -s 'important stuff' -a "$file" -- "$address"
	
done

#!/bin/sh

for file in * 
do
	if echo "$file" | egrep  ".jpg" >/dev/null
	then  
		newFile=`echo "$file" | sed -e s/".jpg"/".png"/`
	#	echo "$file $newFile"	
		if test -e "$newFile"
		then
			echo "$newFile already exists"
		else
			convert "$file" "$newFile"
			rm -f "$file"
		fi
	fi
done

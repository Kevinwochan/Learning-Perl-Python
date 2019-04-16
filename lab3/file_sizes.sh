#!/bin/bash
for file in * 
do
	numLines=$(wc -l "$file"|cut -f1 -d' ')
#	echo "there are $numLines in $file"		
	if [ "$numLines" -lt "10" ]
	then
        	smallFiles="$smallFiles $file"
	elif [ "$numLines" -lt "101" ]
        then 
        	mediumFiles="$mediumFiles $file"
   	else 
        	largeFiles="$largeFiles $file"
	fi
done
echo "Small files:$smallFiles" 
echo "Medium-sized files:$mediumFiles"
echo "Large files:$largeFiles"

#!/bin/sh
for file in *.[ch]
do
	for include_file in `egrep -o "#include \".*?\..\"" "$file"|sed 's/#include //g'|sed 's/"//g'`
	do
		if [ ! -r "$include_file" ]
		then
			echo "$include_file included into $file does not exist"	
		fi
	done
done

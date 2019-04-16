#!/bin/sh

for file in "$@"
do
	#echo "$file"
 	#time=$(ls -l "$file" | cut -d' ' -f6-9 )
	time=$(ls -l --time-style='+%b %_d %H:%M' "$file" | cut -d' ' -f6-9 )
	timeStamp=$(ls -l --time-style='+%Y%m%d%H%M.%S' "$file" | cut -d' ' -f6)
	#echo "$time"
	convert -gravity south -pointsize 36 -draw "text 0,10 '$time'" "$file" temporary_file.tmp
	mv temporary_file.tmp "$file"
	touch -t "$timeStamp" "$file"
	rm -f temporary_file.tmp
done



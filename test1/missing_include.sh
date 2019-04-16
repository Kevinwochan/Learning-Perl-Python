#!/bin/sh
IFS=$'\n'
for cfile in "$@"
do
    for header in `cat "$cfile"|egrep -o '#include \".*h'|sed 's/#include \"//g'`
    do
        #echo "$header"
        if [ "$header" == "stdio.h" ]
        then
            break
        elif [ "$header" == "stdlib.h" ]
        then
            break
        elif [ "$header" == "string.h" ]
        then
            break
        fi
        
        if [ ! -e "$header" ]
        then
            echo "$header included into $cfile does not exist" 
        fi
    done
    
done

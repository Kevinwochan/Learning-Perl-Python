#!/bin/sh
IFS=$'\n'
for file in `ls -1 *.htm`
do
    newFile=`echo "$file" | sed 's/.htm/.html/g'`
    if [ -e "$newFile" ]
    then    
            echo "$newFile exists"
            exit 1;
    else    
        #echo "$file" "$newFile"
            cp "$file" "$newFile"
    fi
    rm -f "$file"
done

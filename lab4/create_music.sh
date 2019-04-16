#!/bin/sh
#if false
#then 
wget -q -O- 'https://en.wikipedia.org/wiki/Triple_J_Hottest_100?action=raw'| 
head -n'607'|
tail -n'543'|
egrep 'Triple J Hottest 100, [0-9]{4}|^#'|
sed 's/\[//g'|
sed 's/\]//g'|
sed 's/ *# *//g' > challenge.tmp 
#sed 's/(.*)//g' 


#fi
mkdir -p created_music

cat challenge.tmp | while read -r line
do
    
    if echo "$line" | egrep -qo 'Triple J Hottest 100, [0-9]{4}'
    then
        album=`echo "$line" | egrep -o 'Triple J Hottest 100, [0-9]{4}'|sed  's/ /\ /g'`
        echo "album is $album"
        mkdir -p created_music/"$album"
        track="1"
    else
        title=`echo "$line" |egrep -o '".*$' | sed  's/"//g'`
        artist=`echo "$line" |egrep -o '^.* –'| sed  's/–//g'`
        echo "$track - $artist - $title"
        #cp sample.mp3 created_music/"$album"/"$song".mp3
        #echo "line is $line"
        track=$((track+1))
    fi
done 
    


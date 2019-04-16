#!/bin/sh
for albumFolder in "$@"
do
	albumName=`echo "$albumFolder"|egrep -o '\/.*'|sed 's/\///g'`
	#echo -e "album name is: $albumName"
    
    if [ "$(ls -A "$albumFolder")" ] 
    then 
        for song in "$albumFolder"/*.mp3
        do
        #echo -e "song is $song"
        title=`echo "$song"|egrep -o ' - .* - '|sed 's/ - //g' `
        #echo "title is $title"
        artist=`echo "$song"|egrep -o ' - .*.mp3'|sed 's/ - .* - \|.mp3//g' `
        #echo "artist is $artist"
        year=`echo "$song"|egrep -o ', [0-9]{4}/'|sed 's/, \|\///g' `
        #echo "year is $year"
        track=`echo "$song"|egrep -o '/[0-9]* - '|sed 's/ - \|\///g' `
        #echo "track is $track"
        id3 -t"$title" "$song" >> /dev/null
        id3 -a"$artist" "$song" >> /dev/null
        id3 -y"$year" "$song" >> /dev/null
        id3 -T"$track" "$song" >> /dev/null
        id3 -A"$albumName" "$song" >> /dev/null
        done
    fi
done


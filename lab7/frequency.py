#!/usr/bin/python 
import sys
import re
import glob


pattern = sys.argv[1].lower()

lyrics = glob.glob('lyrics/*.txt')
lyrics.sort()
for lyric in lyrics:
    wordCount = 0
    matches = 0
    F = open(lyric,"r")
    for line in F:
        words = re.findall('[a-zA-Z]+',line,flags=0)
        for word in words:
            if word.lower() == pattern:
                matches +=1
        wordCount += len(words);
    artist = re.sub('.txt','',lyric,count=0,flags=0)
    artist = re.sub('lyrics\/','',artist,count=0,flags=0)
    artist = re.sub("_"," ",artist,count=0,flags=0)
    
    frequency = float(matches)/float(wordCount)
    
    print "log(("+str(matches)+"/ "+str(wordCount)+") = ",'{:.9f}'.format(frequency),artist
    F.close()


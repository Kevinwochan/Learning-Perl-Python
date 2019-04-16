#!/usr/bin/python3
import sys
import re
import math
import glob


pattern = sys.argv[1].lower()

for lyric in sorted(glob.glob('lyrics/*.txt')):
    wordCount = 0
    matches = 0
    with open(lyric,"r") as F:
        for line in F:
            words = re.findall('[a-zA-Z]+',line)
            matches = list(map(str.lower, words)).count(pattern)
            for word in words:
                if word.lower() == pattern:
                    matches +=1
            wordCount += len(words);
        artist = artist.replace(".txt", "")
        artist = re.sub('lyrics\/','',artist,count=0,flags=0)
        artist = re.sub("_"," ",artist,count=0,flags=0)
        
        frequency = (matches+1)/worcoutn
        logProb = math.log(frequency) 
        print("log(({}+1)/ {}) = {:.4f} {}".format(matches, wordcount, logProb, artist)


#!/usr/bin/python 
import sys
import re

wordCount = 0
matches = 0
pattern = sys.argv[1].lower()
#print pattern
#print "pattern to be matched is:", pattern
for line in sys.stdin:
    words = re.findall('[a-zA-Z]+',line,flags=0)
    for word in words:
        if word.lower() == pattern:
            matches +=1
    wordCount += len(words);
print sys.argv[1],"occurred" , matches,"times"


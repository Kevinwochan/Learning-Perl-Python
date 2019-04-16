#!/usr/bin/python3
import sys
import re
linecount = 0
uniq = 0
diction = {}

for line in sys.stdin:
	line = re.sub('\s+','',line )
	line = str.lower(line)
	linecount+=1
	if not line in diction:
		diction[line] = 1
		uniq +=1
	if uniq >= int(sys.argv[1]):
		print (uniq, "distinct lines seen after", linecount, "lines read.")
		sys.exit() 

print("End of input reached after", linecount, "lines read - ", sys.argv[1], "different lines not seen.")

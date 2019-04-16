#!/usr/bin/python3
import sys
import re
for line in sys.stdin:
	line = re.sub('\n','',line)
	words = line.split()
	words = sorted(words)
	words = " ".join(words)	
	print (words)
